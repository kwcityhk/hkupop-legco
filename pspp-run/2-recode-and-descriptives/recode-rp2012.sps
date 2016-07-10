* starting to analysis

* to run under terminal (mac or linux)

* cd ~/my-git/hkupop-legco/pspp-run/2-recode-and-descriptives
* pspp recode-rp2012.sps -o recode-rp2012-output.pdf


* set paging info ------------

SET WIDTH 132.

SET HEADER YES.

* get file -----------

* macOS full file name
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop.source.data/2012-legco-rolling-survey-RP2012.sav".
*
* macOS relateive file name
*  GET FILE="../hkupop.source.data/2012-legco-rolling-survey-RP2012.sav".
*
* Ubuntu full dfile name
*  GET FILE="/home/kwcityhk/my-git/hkupop-legco/hkupop.source.data/2012-legco-rolling-survey-RP2012.sav".
*
* Windows 7 full dfile name
* GET FILE="C:\Users\kwcity.hk\Documents\GitHub\hkupop-legco\hkupop.source.data\2012-legco-rolling-survey-RP2012.sav".

* recoding -------------
	
RECODE	age1 
			(  1 thru  5=1)    ( 6 thru 10=2) 
			(11 thru 15=3)   (16 thru 20=4)
			(21 thru 25=5)   (26 thru 30=6)
			(31 thru 35=7)   (36 thru 40=8)
			(41 thru 45=9)   (46 thru 50=10)
			(51 thru 55=11) (56 thru 60=12)
			(61 thru 65=13) (66 thru 70=14)
			(71 thru 75=15) (76 thru 80=16)
			(81 thru 98=17) (99            =99) 
			INTO age1recode.
		
VARIABLE LABELS age1recode 'Age Recoded'.

MISSING VALUES age1recode(99).
VALUE LABELS age1recode
   1 ' 1- 5'   2 ' 6-10'
   3 '11-15'   4 '16-20'
   5 '21-25'   6 '26-30'
   7 '31-35'   8 '36-40'
   9 '41-45'  10 '46-50'
  11 '51-55'  12 '56-60'
  13 '61-65'  14 '66-70'
  15 '71-75'  16 '76-80'
  17 '81+'  
  99 '99 (Missing)'.

* save the recoded file -------------------

* macOS full fuile name 
* SAVE OUTFILE = "/Users/kwcity.hk/my-git/hkupop-legco/pspp-run/2012-legco-rolling-survey-RP2012-running.sav".
*
* macOS relateive file name
SAVE OUTFILE = "2012-legco-rolling-survey-RP2012-recode.sav".
*
* Ubuntu full file name
* SAVE OUTFILE = "/home/kwcityhk/my-git/hkupop-legco/pspp-run/2012-legco-rolling-survey-RP2012-running.sav".
*
* Windows 7 full file name
* SAVE OUTFILE = "C:\Users\kwcity.hk\Documents\GitHub\hkupop-legco\pspp-run\2012-legco-rolling-survey-RP2012-running.sav".

EXECUTE.

* get the saved file -----------------------

* macOS relateive file name
GET FILE= "2012-legco-rolling-survey-RP2012-recode.sav".
*
* Ubuntu full file name
* GET            FILE="/home/kwcityhk/my-git/hkupop-legco/pspp-run/2012-legco-rolling-survey-RP2012-running.sav".
*
* WIndows 7 full file name
*  GET            FILE="C:\Users\kwcity.hk\Documents\GitHub\hkupop-legco\pspp-run\2012-legco-rolling-survey-RP2012-running.sav".

* see http://www.ats.ucla.edu/stat/spss/output/descriptives.htm

Title "Descriptives using recoded datasets".

descriptives
 /variables = date district district_vote 
                   q7 q8 q9_1 q9_2 q9_3 q9_4 q9_5 q9_6 
                   R1 R2 R3 R4 R5 R6 R7 R7a R8 
                   v2a v2 v3 v4 
                   sex age1 age2 edu type housing occ income mid
                   age1recode
 /statistics = mean stddev variance min max semean kurtosis skewness.

EXECUTE.

* seems no stemleaf sub-option under plot

Title "examine  using recoded datasets".

examine 
 /variables = date district district_vote 
                   q7 q8 q9_1 q9_2 q9_3 q9_4 q9_5 q9_6 
                   R1 R2 R3 R4 R5 R6 R7 R7a R8 
                   v2a v2 v3 v4 
                   sex age1 age2 edu type housing occ income mid
                   age1recode
 /plot boxplot histogram   
 /percentiles(5,10,25,50,75,90,95,99).

EXECUTE.


Title "Frequencies using recoded datasets".

frequencies
 /variables = date district district_vote 
                   q7 q8 q9_1 q9_2 q9_3 q9_4 q9_5 q9_6 
                   R1 R2 R3 R4 R5 R6 R7 R7a R8 
                   v2a v2 v3 v4 
                   sex age1 age2 edu type housing occ income mid
                   age1recode
 /barchart
 /order variable.

*/format dfreq
*/format=avalue table
* all
*/variables=date to age1recode
* /drop = 
* /keep = 
* no caseid ...

EXECUTE.



Title "Crosstab using recoded datasets".


CROSSTABS 
	/TABLES= age1recode	BY	 v4 v2a R1
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

EXECUTE.

* variables 

* caseid
* date 			- this is rolling survey and hence the date of survey I supposed

* district 		- S3: where you live (19 districts)
* district_vote - S4: which district you vote 

* q7 			- LC1: know about LegCo
* q8 			- LC2: strategic voting

* q9_1 			- LC3-8 ?1: economic policy
* q9_2 			- LC3-8 ?2: political orientation
* q9_3 			- LC3-8 ?3: livelihood policy 
* q9_4 			- LC3-8 ?4: Central Gov. relationship
* q9_5 			- LC3-8 ?5: famous
* q9_6 			- LC3-8 ?6: experience as councillors 

* R1			- LC9-R1   : will vote?
* R2			- LC10-R2  : which election list to support (HK Island)
* R3			- LC11-R3  : -ditto- (Kowloon West)
* R4			- LC12-R4  : -ditto- (Kowloon East)
* R5			- LC13-R5  : -ditto- (NT West)
* R6			- LC14-R6  : -ditto- (NT East)
* R7			- LC15-R7  : "Super" District Council FC
* R7a			- LC15-R7a : "Super" DC registered voters?
* R8 			- LC16-R8  : which election list to support ("Super" DC FC)

* v2a			- LC21  : vote last year district council ?
* v2			- LC21a : vote 2008 LegCo?
* v3			- LC22  : vote in any past district/regional/legco elections?
* v4 			- LC23  : political orientation

* sex 			- DM1  : (more female; have to check with the 
							-hk population and 
							- voter register stat.?)
* age1			- DM2  : exact age at the time of survey 
							- (it change :-)
							- (see below for the age1recode) 
* age2 			- DM2a : not answering exact age (16.9% not telling)
							- not sure why there is DM2c 20-24 and DM2b 30-34
* edu 			- DM3  : 
* type 			- DM4  : self-own or rent
* housing 		- DM5  : type of housing
* occ 			- DM6  : occupation type 
							- (can have weight if align with census ...)
* income 		- DM6b : personal monthly income
* mid			- DM7  : class !!!

* * age1recode	- recode age to 1-5, 6-10 etc.
				- ?? need to recode as age2 will have the remaining info!!!
                   
