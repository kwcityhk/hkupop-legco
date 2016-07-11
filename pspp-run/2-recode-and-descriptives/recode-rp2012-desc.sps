* starting to analysis

* to run under terminal (mac or linux)

* cd ~/my-git/hkupop-legco/pspp-run/2-recode-and-descriptives
* pspp recode-rp2012-desc.sps -o recode-rp2012-desc-output.pdf -e recode-rp2012-desc-issue.txt
* cat recode-rp2012-desc-issue.txt


* set paging info ------------

SET WIDTH 132.

SET HEADER YES.

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
                   age5num 
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
                   age5num
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
                   age5str
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
	/TABLES= age5str	BY	 q7, v4 v2a R1
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
