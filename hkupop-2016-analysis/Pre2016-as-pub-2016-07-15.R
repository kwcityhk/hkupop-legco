# pspp Pre2016-as-pub-2016-07-15.sps -o Pre2016-as-pub-2016-07-15.output2.pdf -e Pre2016-as-pub-2016-07-15.error.txt

#GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop.source.data/Pre2016-as-pub-2016-07-15.sav".

#WEIGHT BY weight.

#FREQUENCIES
#	/VARIABLES= date V1 S5 Q1 Q1_others Q2 Q2_others Q3 Q3_others Q4 Q4_others Q5
#Q5_others Q6 Q7 Q7_others Q8 sex age1 age2 agegp edu edugp occ occgp inclin
#lastlc income
#	/FORMAT=AVALUE TABLE.

# http://www.r-bloggers.com/migrating-from-spss-to-r-rstats/

# cannot red .spss

#install.packages("foreign")
#library("foreign")
#require("foreign")
#legco2016.spss <- read.spss("/Users/kwcity.hk/my-git/hkupop-legco/hkupop-2016-analysis/Pre2016-as-pub-2016-07-15.csv.sav", use.value.labels=FALSE)

# Unrecognized record type 7, subtype 18 encountered in system file

# try the csvy approach

install.packages("rio")

library(rio)
legco2016 <- import("/Users/kwcity.hk/my-git/hkupop-legco/hkupop-2016-analysis/Pre2016-as-pub-2016-07-15.csv.sav")

# http://www.princeton.edu/~otorres/sessions/s2r.pdf

summary(legco2016)

# file.choose()

# you can use db = file.choose()
# dataset = read.spss(db, to.data.frame=TRUE)

dim(legco2016)
head(legco2016)
tail(legco2016)
str(legco2016)
# not available: view()
# seems horrible data editor: fix()

#install.packages("gmodels")

#library(gmodels)
#CrossTable(legco2016$age, legco2016$sex)
# many errors 
# - like x and y must have the same length
# - Error in chisq.test(t, correct = FALSE) : 
# - at least one entry of 'x' must be positive

# http://stackoverflow.com/questions/2479689/crosstab-with-multiple-items

#install.packages("Hmisc")
#install.packages("plyr")

library(Hmisc)
#library(plyr) # this seems cause the lenght issues

#dd <- data.frame(Q1=sample(1:3, 20, replace=T), Q2=sample(1:3, 20, replace=T), 
#                 Q3=sample(1:3, 20, replace=T))  #fake data
#summary(~Q1+Q2+Q3, data=dd, fun=table)


#dd <- data.frame(q1=sample(1:3, 20, replace=T),
#                 q2=sample(1:3, 20, replace=T), 
#                 q3=sample(1:3, 20, replace=T))  #fake data

#cross <- ldply(describe(dd), function(x) x$values[1,])[-1]
#
#rownames(cross) <- c("Q1. Likes it","Q2. Recommends it","Q3. Used it")
#names(cross) <- c("1 (very Often)","2 (Rarely)","3 (Never)")

# same error : x and y must have the same length

summary(~agegp+sex+S5,data=legco2016,fun=Table)

summary(~sex+S5,data=legco2016,fun=Table)

xtabs(~sex+S5,data=legco2016)
xtabs(~agegp+sex+S5,data=legco2016)

# http://rstudio-pubs-static.s3.amazonaws.com/6975_c4943349b6174f448104a5513fed59a9.html

# http://rstudio-pubs-static.s3.amazonaws.com/6975_c4943349b6174f448104a5513fed59a9.html

ID <- seq(1:177)
Age <- sample(c("0-15", "16-29", "30-44", "45-64", "65+"), 177, replace = TRUE)
Sex <- sample(c("Male", "Female"), 177, replace = TRUE)
Country <- sample(c("England", "Wales", "Scotland", "N. Ireland"), 177, replace = TRUE)
Health <- sample(c("Poor", "Average", "Good"), 177, replace = TRUE)
Survey <- data.frame(Age, Sex, Country, Health)
head(Survey)

# Load function
source("http://pcwww.liv.ac.uk/~william/R/crosstab.r")

# Frequency count
crosstab(Survey, row.vars = "Age", col.vars = "Sex", type = "f")

# Row percentages
crosstab(Survey, row.vars = "Age", col.vars = "Sex", type = "r")

# Column percentages
crosstab(Survey, row.vars = "Age", col.vars = "Sex", type = "c")

# Joint percentages (sums to 100 within final two table dimensions)
crosstab(Survey, row.vars = c("Age", "Sex"), col.vars = "Health", type = "j")

# Total percentages (sums to 100 across entire table)
crosstab(Survey, row.vars = c("Age", "Sex"), col.vars = "Health", type = "t")

# All margins...
crosstab(Survey, row.vars = c("Age", "Sex"), col.vars = "Health", type = "f")  #By default addmargins=TRUE

# No margins...
crosstab(Survey, row.vars = c("Age", "Sex"), col.vars = "Health", type = "f", 
         addmargins = FALSE)

# Grand margins only...
crosstab(Survey, row.vars = c("Age", "Sex"), col.vars = "Health", type = "f", 
         subtotals = FALSE)

# Calculate proportions rather than percentages...
crosstab(Survey, row.vars = "Age", col.vars = "Sex", type = "t", percentages = FALSE)

# Round output to 1 decimal place...
crosstab(Survey, row.vars = "Age", col.vars = "Sex", type = "t", percentages = FALSE, 
         dec.places = 1)

# Create a table with two row and two column variables
crosstab(Survey, row.vars = c("Age", "Sex"), col.vars = c("Health", "Country"), 
         type = "f", addmargins = FALSE)

# Create a table with three row and one column variable
crosstab(Survey, row.vars = c("Age", "Sex", "Health"), col.vars = c("Country"), 
         type = "f", addmargins = FALSE)

crosstab(Survey, row.vars = c("Age", "Sex"), col.vars = c("Health", "Country"), 
         type = "f", subtotals = FALSE)

crosstab(Survey, row.vars = "Age")

crosstab(Survey, row.vars = "Age", col.vars = "Sex", type = c("f", "c"), addmargins = FALSE)

# Style = 'wide' [default]
crosstab(Survey, row.vars = "Age", col.vars = "Sex", type = c("f", "t"), style = "wide", 
         addmargins = FALSE)

# Style = 'long'
crosstab(Survey, row.vars = "Age", col.vars = "Sex", type = c("f", "t"), style = "long", 
         addmargins = FALSE)


