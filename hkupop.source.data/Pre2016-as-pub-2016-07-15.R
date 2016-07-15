# pspp Pre2016-as-pub-2016-07-15.sps -o Pre2016-as-pub-2016-07-15.output2.pdf -e Pre2016-as-pub-2016-07-15.error.txt

#GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop.source.data/Pre2016-as-pub-2016-07-15.sav".

#WEIGHT BY weight.

#FREQUENCIES
#	/VARIABLES= date V1 S5 Q1 Q1_others Q2 Q2_others Q3 Q3_others Q4 Q4_others Q5
#Q5_others Q6 Q7 Q7_others Q8 sex age1 age2 agegp edu edugp occ occgp inclin
#lastlc income
#	/FORMAT=AVALUE TABLE.

# http://www.r-bloggers.com/migrating-from-spss-to-r-rstats/

#install.packages("foreign")
library("foreign")

require("foreign")
mydata.spss <- read.spss("/Users/kwcity.hk/my-git/hkupop-legco/hkupop.source.data/Pre2016-as-pub-2016-07-15.portable.sav", 
	use.value.labels=FALSE)
#, 
#	use.missings = to.data.frame)
#to.data.frame = TRUE,


# http://www.princeton.edu/~otorres/sessions/s2r.pdf

summary(mydata)

head(mydata, n=10) # First 10 rows of dataset n=10)