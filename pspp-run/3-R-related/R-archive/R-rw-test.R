
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

#install.packages("gmodels")
#also installing the dependencies ‘gtools’, ‘gdata’

library(gmodels)
CrossTable(mydata.spss$age, mydata.spss$sex, digits=3)


CrossTable(rp2012recode$age5str, rp2012recode$sex)

chisq.test(rp2012recode$age5str, rp2012recode$sex)

chisq.test(rp2012recode$age5str, rp2012recode$age5num)

hist(rp2012recode$age5num)

#install.packages("car")
#also installing the dependencies ‘minqa’, ‘nloptr’, ‘RcppEigen’, ‘lme4’, ‘SparseM’, ‘MatrixModels’, ‘pbkrtest’, ‘quantreg’


library(car)

# not ok
#scatterplot(sex~age5num, data=rp2012recode) # not right


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
	 	