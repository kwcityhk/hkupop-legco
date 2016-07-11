* starting to analysis

* to run under terminal (mac or linux)

* cd ~/my-git/hkupop-legco/pspp-run/2-recode-and-descriptives
* pspp recode-rp2012-all.sps -o recode-rp2012-all-output.pdf -e recode-all-rp2012-issue.txt
* cat recode-rp2012-all-issue.txt


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
			(18 thru 19= 1)
			(20 thru 24= 2)  (25 thru 29=3)
			(30 thru 34= 4)  (35 thru 39=5)
			(40 thru 44= 6)  (45 thru 49=7)
			(50 thru 54= 8)  (55 thru 59=9)
			(60 thru 64=10)  (65 thru 69=11)
			( 0 thru  4=81)  
			( 5 thru  9=82) 
			(10 thru 14=83)  
			(15 thru 17=84)
			(70 thru 98=12) 
			(99        =99) 
			INTO age1recode1.
		
VARIABLE LABELS age1recode1 'Age Recoded'.

MISSING VALUES age1recode1(99).
VALUE LABELS age1recode1
   1 '18-19'   2 '20-24'
   3 '25-29'   4 '30-34'
   5 '35-39'   6 '40-44'
   7 '45-49'   8 '50-54'
   9 '55-59'  10 '60-64'
  11 '65-69'  
  12 '70-98'  
  81 ' 0- 4'
  82 ' 5- 9'  
  83 '10-14'
  84 '15-17'  
  99 '99 (Missing)'.
  
* cannot do ( 1 thru 17=.) 

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
                   age1recode1 
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
                   age1recode1
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
                   age1recode1
 /barchart
 /order variable.

*/format dfreq
*/format=avalue table
* all
*/variables=date to age1recode1
* /drop = 
* /keep = 
* no caseid ...

EXECUTE.

* mainly try to sense what is going on

* more questions needed to check dataset is ok e.g
* filter age = 18 and last year voting etc.

* e.g. in the voting list some should vote in non-HK but answer HK list

Title "Crosstab using recoded datasets".


CROSSTABS 
	/TABLES= age1recode1	BY	 q7, v4 v2a R1
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

EXECUTE.


CROSSTABS 
	/TABLES= district	BY	 district_vote
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

EXECUTE.

* below 2 should filter by R1

CROSSTABS 
	/TABLES= district_vote	BY	 R1 to R6
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

EXECUTE.

CROSSTABS 
	/TABLES= district_vote	BY	 R7 to R8
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
*				- ?? need to recode as age2 will have the remaining info!!!
                   
