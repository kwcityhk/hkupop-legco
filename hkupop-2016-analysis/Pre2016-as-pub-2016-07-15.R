# has to deal with weight WEIGHT BY weight.

# see var info md
# also look under R-studio right hand side Environment

# try http://www.r-bloggers.com/migrating-from-spss-to-r-rstats/
#   but cannot read .spss
#     install.packages("foreign")
#     library("foreign")
#     require("foreign")
#     legco2016.spss <- read.spss("/Users/kwcity.hk/my-git/hkupop-legco/hkupop-2016-analysis/Pre2016-as-pub-2016-07-15.csv.sav", use.value.labels=FALSE)
#   error : Unrecognized record type 7, subtype 18 encountered in system file

# instead try the csvy approach

#install.packages("rio")

library(rio)

# file.choose() # to find the files

legco2016_0715 <- import("/Users/kwcity.hk/my-git/hkupop-legco/hkupop-2016-analysis/Pre2016-as-pub-2016-07-15.csv.sav")

# ---- try to reproduce the data ----

# http://adv-r.had.co.nz/Subsetting.html

#legco2016_0715_HK <-  subset(legco2016_0715, S5 =  1)  # lost labels

legco2016_0715_HK <- legco2016_0715[legco2016_0715$S5==1,] # still lost lables

table(legco2016_0715_HK$Q1)
table(legco2016_0715_HK$Q, exclude=NULL)
table(is.na(legco2016_0715_HK$Q1)) 

table(legco2016_0715_HK$Q1)
table(legco2016_0715_HK$Q1,useNA="no")
table(legco2016_0715_HK$Q1,useNA="ifany")
table(legco2016_0715_HK$Q1,useNA="always")

# error in reporting as this will report NA but NOT those 3 values ...
#table(legco2016_0715_HK$Q1_HK, exclude=c(8885, 8886,8888)) #not sure how: if (useNA == "no") c(8885, 8886,8888), useNA="no")

# This goes back to the one which Q1 minus the 3 values and NA!!
table(legco2016_0715_HK$Q1, exclude=c(8885, 8886,8888, NA))

# http://www.r-bloggers.com/no-need-for-spss-beautiful-output-in-r-rstats/

#install.packages("sjPlot")
#install.packages("sjmisc")

library(sjPlot) #??? or require ???
#require(sjPlot) # load package

# load sample data
head(legco2016_0715)
data() # why errors
# retrieve value and variable labels
variables <- sji.getVariableLabels(legco2016_0715)
values <- sji.getValueLabels(legco2016_0715)
sjt.frq(legco2016_0715$Q3,  variableLabels=variables['Q3'],
        valueLabels=values[['Q3']], sort.frq = "des", string.na="Missing") # , string.val=FALSE) # ,show.na=TRUE)

sjt.frq(legco2016_0715_HK$Q1,sort.frq = "des", string.na="Missing") # , string.val=FALSE) # ,show.na=TRUE)

sjt.frq(legco2016_0715_HK$Q1,sort.frq = "des", string.na="Missing", value.labels = TRUE)

sjt.frq(legco2016_0715$Q1,sort.frq = "des", string.na="Missing")

sjt.xtab(legco2016_0715$sex, legco2016_0715$agegp)
sjt.xtab(legco2016_0715$sex, legco2016_0715$agegp,
          show.cell.prc = TRUE, show.row.prc=TRUE, show.col.prc =TRUE, show.exp = TRUE)

sjt.xtab(legco2016_0715$sex, legco2016_0715$agegp)

# not working sjt.frq(as.data.frame(cbind(legco2016_0715_HK$Q1,legco2016_0715_HK$Q2,legco2016_0715_HK$Q3)),sort.frq = "des", string.na="Missing") 

install.packages("descr")
library(descr)

freq(legco2016_0715$Q1)
freq(legco2016_0715$Q1,user.missing=NA)
freq(legco2016_0715$Q1,user.missing=-99)
freq(legco2016_0715$Q1,user.missing=c(-99,NA)) 
freq(legco2016_0715_HK$Q1,user.missing=-99)

# last resort -> http://stackoverflow.com/questions/20141718/r-table-outputs-like-spss-plus-export-to-ms-word


# ---- my own exploration; keep it here for future me to investigate ----

# http://www.princeton.edu/~otorres/sessions/s2r.pdf

summary(legco2016_0715)

# you can use db = file.choose()
# dataset = read.spss(db, to.data.frame=TRUE)

dim(legco2016)
head(legco2016)
tail(legco2016)
str(legco2016)
# not available: view()
# seems horrible data editor: fix()

#install.packages("gmodels")

# library(gmodels)
#   CrossTable(legco2016$age, legco2016$sex)
#     many errors 
#     - like x and y must have the same length
#     - Error in chisq.test(t, correct = FALSE) : 
#     - at least one entry of 'x' must be positive

# http://stackoverflow.com/questions/2479689/crosstab-with-multiple-items

#install.packages("Hmisc")
#install.packages("plyr")

library(Hmisc)
#   library(plyr) # this seems cause the lenght issues
#   - # same error : x and y must have the same length

# could try these later desc. later
# rownames(cross) <- c("Q1. Likes it","Q2. Recommends it","Q3. Used it")
# names(cross) <- c("1 (very Often)","2 (Rarely)","3 (Never)")

summary(~agegp+sex+S5,data=legco2016_0715,fun=Table) # missing some info
summary(~sex+S5,data=legco2016_0715,fun=Table) # missing some info

xtabs(~sex+S5,data=legco2016_0715)
xtabs(~agegp+sex+S5,data=legco2016_0715)

# http://rstudio-pubs-static.s3.amazonaws.com/6975_c4943349b6174f448104a5513fed59a9.html

# Load function
source("http://pcwww.liv.ac.uk/~william/R/crosstab.r")

# Frequency count
crosstab(legco2016_0715, row.vars = "agegp", col.vars = "sex", type = "f")

# not useful

y <- c(0,0,1,3,4,4)
table(y)
table(factor(y))
table(factor(y,levels=0:5))

# http://www.r-bloggers.com/r-function-of-the-day-table/

# > ## generate data for medical example
clinical.trial <-
  data.frame(patient = 1:100,
             age = rnorm(100, mean = 60, sd = 6),
             treatment = gl(2, 50,
                            labels = c("Treatment", "Control")),
             center = sample(paste("Center", LETTERS[1:5]), 100, replace = TRUE))

## set some ages to NA (missing)

is.na(clinical.trial$age) <- sample(1:100, 20)
summary(clinical.trial)

## a simple example of a table call
table(clinical.trial$center)

## a logical vector is created and passed into table
table(clinical.trial$age < 60)

## the useNA argument shows the missing values, too
table(clinical.trial$age < 60, useNA = "always")

## the table of missing age by center
table(clinical.trial$center, is.na(clinical.trial$age))

## centers with most missing ages listed in order
## highest to lowest
sort(table(clinical.trial$center, is.na(clinical.trial$age))[, 2],
         decreasing = TRUE)



# http://www.princeton.edu/~otorres/sessions/s2r.pdf

table(legco2016_0715$sex)
table(legco2016_0715$agegp)
# Two-way tables
agegpSex <- table(legco2016_0715$agegp,legco2016_0715$sex)
agegpSex
addmargins(agegpSex)   # Adding row/col margins
chisq.test(agegpSex)

# fisher.test issue LDSTP is too small for this problem. Try increasing the size of the workspace.
# http://stackoverflow.com/questions/17052639/fisher-test-error-ldstp-is-too-small

# cannot finish fisher.test
fisher.test(agegpSex,simulate.p.value=TRUE,B=1e7) 


# Do chisq test Ho: no relathionship
# Do fisher'exact test Ho: no relationship
install.packages("vcd")
library(vcd)
assocstats(agegpSex)
# First two are assoc measures, last three show degree of association.
# 3-way crosstabs
table3 <- xtabs(~agegp+sex+S5, data=legco2016_0715)
table3
ftable(table3) # very useful for the district one (exactly the same)

library(gmodels)
legco2016_0715$ones <- 1 # Create a new variable of ones 
CrossTable(legco2016_0715$agegp,digits=2, max.width=6) 
# Shows horizontal 
CrossTable(legco2016_0715$sex,digits=2, max.width=1) 
CrossTable(legco2016_0715$sex,digits=2, max.width=2) 
# Shows vertical 
CrossTable(legco2016_0715$agegp,legco2016_0715$ones, digits=2)
CrossTable(legco2016_0715$sex,legco2016_0715$ones, digits=2) 
CrossTable(legco2016_0715$agegp,legco2016_0715$sex,digits=2, expected=TRUE,dnn=c("Age Group","Sex")) 
CrossTable(legco2016_0715$agegp,legco2016_0715$sex,digits=2, chisq=TRUE, dnn=c("Age Group","Sex")) 
CrossTable(legco2016_0715$agegp,legco2016_0715$sex,digits=2, dnn=c("Age Group","Sex")) 
#CrossTable(legco2016_0715$agegp,legco2016_0715$sex, format=c("SPSS"), digits=1) chisq.test(legco2016_0715$agegp,legco2016_0715$sex) # Null hipothesis: no association
CrossTable(legco2016_0715$agegp,legco2016_0715$sex, digits=1) # Null hipothesis: no association


barplot(margin.table(agegpSex,1)) barplot(margin.table(agegpSex,2))

install.packages("pastecs")
library(pastecs)
stat.desc(legco2016_0715)
stat.desc(legco2016_0715[,c("Age","SAT","Score","Height", "Read")]) stat.desc(legco2016_0715[,c("Age","SAT","Score")], basic=TRUE, desc=TRUE, norm=TRUE, p=0.95) stat.desc(legco2016_0715[10:14], basic=TRUE, desc=TRUE, norm=TRUE, p=0.95)

# --- handle missing ----

# not working table(legco2016_0715$S5,na.rm=TRUE) 
summary(legco2016_0715$Q1,na.rm=TRUE) # no difference
summary(legco2016_0715$Q1)

mean(legco2016_0715$Q1,na.rm=TRUE) # 
mean(legco2016_0715$Q1) # cannot do this !!!

# http://discuss.analyticsvidhya.com/t/how-to-count-the-missing-value-in-r/2949

table(legco2016_0715$Q1)
table(legco2016_0715$Q1, exclude=NULL)
table(is.na(legco2016_0715$Q1)) 

table(legco2016_0715$Q1)
table(legco2016_0715$Q1,useNA="no")
table(legco2016_0715$Q1,useNA="ifany")
table(legco2016_0715$Q1,useNA="always")

# error in reporting as this will report NA but NOT those 3 values ...
table(legco2016_0715$Q1, exclude=c(8885, 8886,8888)) #not sure how: if (useNA == "no") c(8885, 8886,8888), useNA="no")

# This goes back to the one which Q1 minus the 3 values and NA!!
table(legco2016_0715$Q1, exclude=c(8885, 8886,8888, NA))

# not sure: sapply(legco2016_0715$Q1, function(x) sum(is.na(x)))
# not sure and error: rowSums(is.na(legco2016_0715$Q1))

# http://www.r-bloggers.com/no-need-for-spss-beautiful-output-in-r-rstats/

# see also http://www.strengejacke.de/sjPlot/sjp.frq/

install.packages("sjPlot")
#install.packages("sjmisc")

library(sjPlot) #???
#require(sjPlot) # load package

# load sample data
data(legco2016_0715)
# retrieve value and variable labels
variables <- sjt.getVariableLabels(legco2016_0715)
values <- sjt.getValueLabels(legco2016_0715)
# simple frequency table
sjt.stackfrq(legco2016_0715$Q1,sort.frq = "des", show.na = "TRUE")

sjt.frq(legco2016_0715$Q1)
sjt.frq(legco2016_0715$Q1,sort.frq = "des", string.na="Missing") # , string.val=FALSE) # ,show.na=TRUE)
sjt.frq(legco2016_0715$Q1,sort.frq = "des",show.summary = TRUE)
# not working
#  sjt.frq(legco2016_0715$Q1,
#        variableLabels=variables['Q1'],
#        valueLabels=values[['Q1']])


# http://www.gettinggeneticsdone.com/2011/02/summarize-missing-data-for-all.html

# === just cpu ===

# http://dept.stat.lsa.umich.edu/~bobyuen/gpuwiki/

#install.packages("multicore") # not available for R.3.3.0
install.package("parallel")
library(parallel)

# need to change I think

set.seed(5446)
p <- 20
X <- matrix(rnorm(2^p),ncol = 2^(p/2))

lfun <- function(i){
       d <- dist(X)  
    }
 
system.time(res <- lapply(1:4,lfun))
#user  system elapsed 
#26.286   0.073  26.376 
 
system.time(mcres <- mclapply(1:4,lfun))
#user  system elapsed 
#13.649   0.096  13.857 

# not sure it is paralllel ....

# --- gpu -----

# https://github.com/nullsatz/gputools/wiki

# just install.packages("gputools") # answer y to compile it ...

#install.packages("gputools") 
library(gputools)

ls()
library()
getGpuId()

matA <- matrix(runif(2*3), 2, 3)
matB <- matrix(runif(3*4), 3, 4)
cpuMatMult(matA, matB)


numAvars <- 5
numBvars <- 10
numSamples <- 30
A <- matrix(runif(numAvars*numSamples), numSamples, numAvars)
B <- matrix(runif(numBvars*numSamples), numSamples, numBvars)
gpuCor(A, B, method="pearson")


## Dobson (1990) Page 93: Randomized Controlled Trial :
counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
print(d.AD <- data.frame(treatment, outcome, counts))
glm.D93 <- gpuGlm(counts ~ outcome + treatment, family=poisson())
anova(glm.D93)
summary(glm.D93)
# A Gamma example, from McCullagh & Nelder (1989, pp. 300-2)
clotting <- data.frame(
  u = c(5,10,15,20,30,40,60,80,100),
  lot1 = c(118,58,42,35,27,25,21,19,18),
  lot2 = c(69,35,26,21,18,16,13,12,12))
summary(gpuGlm(lot1 ~ log(u), data=clotting, family=Gamma))
summary(gpuGlm(lot2 ~ log(u), data=clotting, family=Gamma))

numVectors <- 5
dimension <- 10
Vectors <- matrix(runif(numVectors*dimension), numVectors, dimension)
distMat <- gpuDist(Vectors, "euclidean")
myClust <- gpuHclust(distMat, "single")
plot(myClust)

# require(graphics)
## Annette Dobson (1990) "An Introduction to Generalized Linear Models".
## Page 9: Plant Weight Data.
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2,10,20, labels=c("Ctl","Trt"))
weight <- c(ctl, trt)
anova(lm.D9 <- gpuLm(weight ~ group))
summary(lm.D90 <- gpuLm(weight ~ group - 1))# omitting intercept
summary(resid(lm.D9) - resid(lm.D90)) #- residuals almost identical
opar <- par(mfrow = c(2,2), oma = c(0, 0, 1.1, 0))
plot(lm.D9, las = 1) # Residuals, Fitted, ...
par(opar)
## model frame :
stopifnot(identical(gpuLm(weight ~ group, method = "model.frame"),
                    model.frame(lm.D9)))
### less simple examples in "See Also" above



##-- Using the same data as the lm(.) example:
lsD9 <- gpuLsfit(x = unclass(gl(2,10)), y = weight)
ls.print(lsD9)

