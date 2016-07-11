# https://www.kaggle.com/gaggin/titanic/make-neural-networks-compete/run/57499/code
# http://bobby.gramacy.com/teaching/bayes/setcwd.pdf
#library(foreign)
#setwd("kaggle-titanic/")
getwd()
setwd("/Volumes/osx-int/")
# 0.78947


# create a 2 by 5 matrix
x <- matrix(1:10, ncol = 5)

# the file data contains x, two rows, five cols
# 1 3 5 7 9 will form the first row
write(t(x))

# Writing to the "console" 'tab-delimited'
# two rows, five cols but the first row is 1 2 3 4 5
write(x, "", sep = "\t")
write(x, "R-test-write6.txt", sep = "\t")

unlink("data") # tidy up

write(x, "", sep = "\t")

train<-read.csv("train.csv") # it must be that name it seemed, very strangely
test<-read.csv("test.csv") # it must be that name it seemed, very strangely

#install.packages("dplyr")
library(dplyr)

#install.packages("tidyr")
library(tidyr)

#install.packages("neuralnet")
library(neuralnet)

# check for NAs
# train %>% sapply(function(x){sum(is.na(x))})

# drop two entries with no Embarked values
train<-train[train$Embarked!="",]

# set NA ages to mean for the class and sex
newage<-function(age,class,sex){if(is.na(age)){
                mean(train[train$Sex==sex &
                                   train$Pclass==class,]$Age,na.rm=TRUE)}
                else age}

train$newage<- mapply(newage, train$Age, train$Pclass, train$Sex)

# make name length a feature
tr1<-train %>%
        mutate(lname=sapply(as.character(Name),nchar)) %>%
        mutate(ageknown=is.na(Age)) %>%
        dplyr::select(-Ticket,-Cabin,-Name,-Age)

bins<-tr1 %>% # piped functions follow
        
        # make it narrow, don't touch numeric variables and IDs
        gather(catnames,catvalues,-PassengerId,-Survived,-newage,-Fare,-SibSp,
               -Parch,-lname,-ageknown) %>%
        
        # make single column out of them
        unite(newfactor,catnames,catvalues,sep=".") %>%
        
        # add a new column - it's "1" for every record
        mutate( is = 1) %>%
        
        # create a column from each factor, and where there's no record, add "0"
        spread(newfactor, is, fill = 0)

seed<-2
##prepare list for neuralnet() call
#cat(paste0(names(bins),sep="+"))
bins.nn<-function(df,rep=1,hidden=c(1),threshold=0.1) {
        set.seed(seed)
        nn.obj<-neuralnet(Survived ~ SibSp+ Parch+ Fare+ newage+ lname+ ageknown+ Embarked.C+ Embarked.Q+ Embarked.S+ Pclass.1+ Pclass.2+ Pclass.3+ Sex.female+ Sex.male,
                          data=df,
                          hidden=hidden,
                          lifesign="full",
                          lifesign.step=2000,
                          threshold=threshold,
                          rep=rep)
        return(nn.obj)}

# clean up results from NAs and 2s
cleanup<-function(vect){
        sapply(vect,function(x){
                if(is.na(x)) 0
                else if(x>0) 1
                else 0})}

qualify<-function(real,guess){
        check<-table(real,guess)
        if(sum(dim(check)==c(2,2))!=2) percentage<-0
        else{
                good.ones<-check[1,1]+check[2,2]
                bad.ones<-check[1,2]+check[2,1]
                #paste0(as.character()),'%')
                percentage<-round(100*good.ones/(good.ones+bad.ones))
        }#if(is.na(percentage)) percentage<-0
        return(percentage)
}

# In internal tests, split train set to train/test part and check how
# the selected algorithm works
## BEGIN internal tests
if(FALSE){
        
        
        #nr<-dim(bins)[1] # number of observations
        #share<-0.8 # this is our 80% parameter
        #set.seed(seed)
        #trainset<-sample.int(nr,round(share*nr))
        
        #trainers<-bins[trainset,]
        #testers<-bins[-trainset,]
        trainers<-bins
        
        nfeat<-dim(bins)[2] 
        
        #n.testers<-bins.nn(trainers,rep=3,hidden=c(4),threshold=0.25)
        
        #res.testers<-neuralnet::compute(n.testers,testers[,3:nfeat])
        #qualify(cleanup(round(res.testers$net.result)),testers$Survived)

        mult<-list()
        eff<-list()
        tries=50
        for(i in 1:tries){
                cat("Iteration #",i,"/",tries,"\n")
                set.seed(i)
                r<- 3#as.integer(runif(1,5,10))
                h<- 5#as.integer(runif(1,5,10))
                t<- 0.2#as.integer(runif(1,5,10))
                nr1<-dim(trainers)[1]
                ttrainset<-sample.int(nr1,round(0.9*nr1))
                ttrainers<-trainers[ttrainset,]
                ttesters<-trainers[-ttrainset,]
                mult[[i]]<-bins.nn(ttrainers,rep=r,hidden=h,threshold=t)
                
                res<-neuralnet::compute(mult[[i]],ttesters[,3:nfeat])
                eff[[i]]<-qualify(cleanup(round(res$net.result)),
                                  ttesters$Survived)
                print(eff[[i]])
        }
        
        pult<-matrix(NA, nrow=dim(bins.test)[1])
        alltries<-1:tries
        mineff<-85##########################
        goodtries<-alltries[unlist(eff)>mineff]
        for(i  in goodtries){
                res<-neuralnet::compute(mult[[i]],bins.test[,2:nfeat.test])#testers[,3:nfeat])
                pult<-cbind(pult,cleanup(round(res$net.result)))                           
        }
        pult<-dplyr::select(as.data.frame(pult),-V1) # drop NA column
        predi<-rowSums(pult)
        cu<-mean(predi[predi!=0]) ###############
        #cu<-0.5*max(predi)
        ppredi<-sapply(predi,function(x)if(x>cu) 1 else 0)
        #qualify(ppredi,testers$Survived)
}
## END internal tests
        
# Train with full train set
#n.full<-bins.nn(bins,rep=5,hidden=c(4),threshold=0.25)

##### Now test data

test$newage<- mapply(newage, test$Age, test$Pclass, test$Sex)

ts1<-test %>%
        mutate(lname=sapply(as.character(Name),nchar)) %>%
        mutate(ageknown=is.na(Age)) %>%
        dplyr::select(-Ticket,-Cabin,-Name,-Age)

bins.test<-ts1 %>% # piped functions follow
        
        # make it narrow, don't touch numeric variables and IDs
        gather(catnames,catvalues,-PassengerId,-newage,-Fare,-SibSp,
               -Parch,-lname,-ageknown) %>%
        
        # make single column out of them
        unite(newfactor,catnames,catvalues,sep=".") %>%
        
        # add a new column - it's "1" for every record
        mutate( is = 1) %>%
        
        # create a column from each factor, and where there's no record, add "0"
        spread(newfactor, is, fill = 0)

nfeat.test<-dim(bins.test)[2] 

#res<-neuralnet::compute(n.full,bins.test[,2:nfeat.test])
#upload<-cleanup(round(res$net.result))

trainers<-bins

nfeat<-dim(bins)[2] 

#n.testers<-bins.nn(trainers,rep=3,hidden=c(4),threshold=0.25)

#res.testers<-neuralnet::compute(n.testers,testers[,3:nfeat])
#qualify(cleanup(round(res.testers$net.result)),testers$Survived)

mult<-list()
eff<-list()
tries=500
for(i in 1:tries){
        cat("Iteration #",i,"/",tries,"\n")
        set.seed(i)
        r<- 1#as.integer(runif(1,5,10))
        h<- 5#as.integer(runif(1,5,10))
        t<- 0.1#as.integer(runif(1,5,10))
        nr1<-dim(trainers)[1]
        ttrainset<-sample.int(nr1,round(0.9*nr1))
        ttrainers<-trainers[ttrainset,]
        ttesters<-trainers[-ttrainset,]
        mult[[i]]<-bins.nn(ttrainers,rep=r,hidden=h,threshold=t)
        
        res<-neuralnet::compute(mult[[i]],ttesters[,3:nfeat])
        eff[[i]]<-qualify(cleanup(round(res$net.result)),
                          ttesters$Survived)
        print(eff[[i]])
}

pult<-matrix(NA, nrow=dim(bins.test)[1])
alltries<-1:tries
mineff<-90##########################
goodtries<-alltries[unlist(eff)>mineff]
for(i  in goodtries){
        res<-neuralnet::compute(mult[[i]],bins.test[,2:nfeat.test])#testers[,3:nfeat])
        pult<-cbind(pult,cleanup(round(res$net.result)))                           
}
pult<-dplyr::select(as.data.frame(pult),-V1) # drop NA column
predi<-rowSums(pult)
cu<-mean(predi[predi!=0]) ###############
#cu<-0.5*max(predi)
ppredi<-sapply(predi,function(x)if(x>cu) 1 else 0)

upload<-ppredi
names(upload)<-c("Survived")
upload1<-data.frame(cbind(bins.test$PassengerId,upload))
names(upload1)<-c("PassengerId","Survived")
write.csv(upload1,file="titanic-kaggie-res.csv",row.names=FALSE,quote=FALSE)

