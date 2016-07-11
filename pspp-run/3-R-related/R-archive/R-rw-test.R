# create a 2 by 5 matrix
x <- matrix(1:10, ncol = 5)

# the file data contains x, two rows, five cols
# 1 3 5 7 9 will form the first row
write(t(x))

# Writing to the "console" 'tab-delimited'
# two rows, five cols but the first row is 1 2 3 4 5
write(x, "", sep = "\t")
write(x, "/Volumes/osx-int/R-test-write2.txt", sep = "\t")

unlink("data") # tidy up

#not sure
#library(foreign)

#install.packages("memisc")

library(memisc)
#data <- as.data.set(spss.system.file("RP2012.sav"))
#rp2012 <- as.data.set(spss.system.file("/Volumes/osx-int/RP2012.sav"))
rp2012recode <- as.data.set(spss.system.file("/Users/kwcity.hk/my-git/hkupop-legco/pspp-run/2-recode-and-descriptives/2012-legco-rolling-survey-RP2012-recode.sav"))

#install.packages("plyr")
library(plyr)
count(rp2012recode,'date')

# http://www.pmc.ucsc.edu/~mclapham/Rtips/variableinfo.htm

names(rp2012recode)

#[1] "caseid"        "date"          "district"      "district_vote" "q7"            "q8"            "q9_1"          "q9_2"          "q9_3"          "q9_4"          "q9_5"
#[12] "q9_6"          "r1"            "r2"            "r3"            "r4"            "r5"            "r6"            "r7"            "r7a"           "r8"            "v2a"
#[23] "v2"            "v3"            "v4"            "sex"           "age1"          "age2"          "edu"           "type"          "housing"       "occ"           "income"
#[34] "mid"           "age1recode1"   "age3"          "age5str"       "age5num"

# http://www.statmethods.net/stats/descriptives.html

# sapply(rp2012recode, mean, na.rm=TRUE)

summary(rp2012recode)

# http://www.ats.ucla.edu/stat/r/faq/basic_desc.htm

# install.packages("pastecs")
library(pastecs)

attach(rp2012recode)
mylist <- cbind(age1, age2, age5str, age5num)
stat.desc(mylist) # not ok
stat.desc(caseid) # ok

#hs0<-read.table("http://www.ats.ucla.edu/stat/data/hs0.csv", sep=",", header=T)
#head(hs0)
#attach(hs0)

library(pastecs)
hs0<-read.table("http://www.ats.ucla.edu/stat/data/hs0.csv", sep=",", header=T)
head(hs0)
names(hs0)
attach(hs0)
scores<-cbind(read, write, math, science, socst)
stat.desc(scores)
options(scipen=100)
options(digits=2)
stat.desc(scores)
stat.desc(scores, basic=F)
stat.desc(scores, desc=F)

# http://www.princeton.edu/~otorres/sessions/s2r.pdf

#install.packages("foreign") # Need to install package –-foreign–- first (you do this only once)

library(foreign) # Load package –-foreign--

mydata.spss <- read.spss("http://dss.princeton.edu/training/mydata.sav",
                            to.data.frame = TRUE,
                            use.value.labels=TRUE,
                            use.missings = to.data.frame)

mydata.spss[12:23,2:4]
tail(mydata.spss)
head(mydata.spss)

summary(mydata.spss)


#install.packages("gmodels")
#also installing the dependencies ‘gtools’, ‘gdata’

library(gmodels)
CrossTable(mydata.spss$age, mydata.spss$sex, digits=3)


CrossTable(rp2012recode$age5str, rp2012recode$sex)

chisq.test(rp2012recode$age5str, rp2012recode$sex)

chisq.test(rp2012recode$age5str, rp2012recode$age5num)

hist(rp2012recode$age5num)

plot(mydata.spss$age, mydata.spss$sex) # meaningless

plot(mydata.spss$age, mydata.spss$edu)

#install.packages("car")
#also installing the dependencies ‘minqa’, ‘nloptr’, ‘RcppEigen’, ‘lme4’, ‘SparseM’, ‘MatrixModels’, ‘pbkrtest’, ‘quantreg’


library(car)

# not ok
#scatterplot(sex~age5num, data=rp2012recode) # not right

# Where: #
# ‘to.data.frame’ return a data frame.
#
# ‘use.value.labels’ Convert variables with value labels into R factors with those levels.
#
# ‘use.missings’ logical: should information on user-defined missing values be used to set the corresponding values to NA.

#Source: type ?read.spss

# Provides a syntax file (*.sps) to read the *.raw data file

# not test
# write.foreign(mydata, codefile="test2.sps", datafile="test2.raw", package=“SPSS")


library(car)
# not test
#scatter3d(prestige ~ income + education, id.n=3, data=Duncan)


# Scatterplots (for categorical data)
#plot(vocabulary ~ education, data=Vocab)
#plot(jitter(vocabulary) ~ jitter(education), data=Vocab)

#plot(jitter(vocabulary, factor=2) ~ jitter(education, factor=2), data=Vocab)

# cex makes the point half the size, p. 134
#plot(jitter(vocabulary, factor=2) ~ jitter(education, factor=2), col="gray", cex=0.5, data=Vocab) with(Vocab, {
#		abline(lm(vocabulary ~ education), lwd=3, lty="dashed")
#	 	lines(lowess(education, vocabulary, f=0.2), lwd=3)
#	 	})
	 	
# graphics links

# http://www.stat.auckland.ac.nz/~paul/RGraphics/rgraphics.html
# http://addictedtor.free.fr/graphiques/ 
# http://addictedtor.free.fr/graphiques/thumbs.php?sort=votes 
# http://www.statmethods.net/advgraphs/layout.html

# other good one

# http://data.princeton.edu/R/readingData.html
# https://www.datacamp.com/community/tutorials/r-data-import-tutorial

# Titanic good examples of R, Python ... 

# https://www.kaggle.com/c/titanic/details/getting-started-with-python
# https://www.kaggle.com/c/titanic/details/getting-started-with-python-ii
# https://www.kaggle.com/c/titanic/details/getting-started-with-random-forests
# https://www.kaggle.com/c/titanic/details/new-getting-started-with-r
# https://www.kaggle.com/c/titanic/forums/t/5105/ipython-notebook-tutorial-for-titanic-machine-learning-from-disaster/126076#post126076
# https://www.kaggle.com/c/titanic/data

# neu net

# http://openmachin.es/blog/titanic-disaster
# https://github.com/openmachinesblog/titanic-disaster

# http://blog.wikunia.de/blog/learning-sigmoid-neuron
# http://blog.wikunia.de/blog/first-steps

# http://deeplearning.net/tutorial/mlp.html

# http://openmachin.es/blog/titanic-disaster

# neu net in R

# http://datascienceplus.com/perform-logistic-regression-in-r/
# https://www.kaggle.com/gaggin/titanic/make-neural-networks-compete/run/57499

# https://www.kaggle.com/gaggin/titanic/make-neural-networks-compete/run/57499 file strange places
# https://github.com/mdelhey/kaggle-titanic/blob/master/4-neuralnet.R
# http://stackoverflow.com/questions/30386065/how-to-use-rs-neuralnet-package-in-a-kaggle-competition-about-titanic
# http://will-stanton.com/machine-learning-with-r-an-irresponsibly-fast-tutorial/
# https://triangleinequality.wordpress.com/2013/09/05/a-complete-guide-to-getting-0-79903-in-kaggles-titanic-competition-with-python/
# http://stats.stackexchange.com/questions/41771/r-libraries-for-deep-learning

