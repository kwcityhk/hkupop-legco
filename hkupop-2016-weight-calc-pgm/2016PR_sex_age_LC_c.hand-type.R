# http://www.r-bloggers.com/how-to-open-an-spss-file-into-r/

#install.packages("foreign")
library(foreign)

# file.choose()
#
# dataset return is "/Users/kwcity.hk/my-git/hkupop-legco/info.from.gov.src/2016PR_sex_age_LC_c.hand-type.data.sav"

# note the PC format: dataset = read.spss("C:\\PathToFile\\MyDataFile.sav", to.data.frame=TRUE)

sexAge2016 = read.spss("/Users/kwcity.hk/my-git/hkupop-legco/hkupop-2016-weight-calc-pgm/2016PR_sex_age_LC_c.hand-type.data.sav",
                        to.data.frame=TRUE)

# you can use db = file.choose()
# dataset = read.spss(db, to.data.frame=TRUE)

dim(sexAge2016)
head(sexAge2016)
tail(sexAge2016)
str(sexAge2016)
# not available: view(sexAge2016)
# seems horrible data editor: fix(sexAge2016)