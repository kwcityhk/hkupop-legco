* starting to analysis

* to run under terminal (mac or linux)

* cd ~/my-git/hkupop-legco/pspp-run/2-recode-and-descriptives
* pspp recode-rp2012-save-var-info.sps -o recode-rp2012-save-var-info-output.pdf -e recode-rp2012-save-var-info-issue.txt
* cat recode-rp2012-save-var-info-issue.txt


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
		
VARIABLE LABELS age1recode1 '13506 Age 1 Recoded (missing 2747)'.

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
  
*STRING age3 (A2).

* Note ELSE IF xxxx.
* if varx = sysmis(age1)
* vary = sysmis(age1)

DO IF (MISSING(age1) OR sysmis(age1)).
	COMPUTE age3 = age2. 
ELSE. 
    IF (age1 >=18 AND age1 < 20) age3 = 1. 
    IF (age1 >=20 AND age1 < 25) age3 = 2. 
    IF (age1 >=25 AND age1 < 30) age3 = 3. 
    IF (age1 >=30 AND age1 < 35) age3 = 4. 
    IF (age1 >=35 AND age1 < 40) age3 = 5. 
    IF (age1 >=40 AND age1 < 45) age3 = 6. 
    IF (age1 >=45 AND age1 < 50) age3 = 7. 
    IF (age1 >=50 AND age1 < 55) age3 = 8. 
    IF (age1 >=55 AND age1 < 60) age3 = 9. 
    IF (age1 >=60 AND age1 < 65) age3 = 10. 
    IF (age1 >=65 AND age1 < 70) age3 = 11. 
    IF (age1 >=70              ) age3 = 12. 
    
END IF. 


STRING age5str (A2).
COMPUTE age5str = string(age3, F2.0).

VARIABLE LABELS age5str 'Age 5 str'.

MISSING VALUES age5str("99").
VALUE LABELS age5str
   " 1" '18-19'   " 2" '20-24'
   " 3" '25-29'   " 4" '30-34'
   " 5" '35-39'   " 6" '40-44'
   " 7" '45-49'   " 8" '50-54'
   " 9" '55-59'  "10" '60-64'
  "11" '65-69'  
  "12" '70-98'.

COMPUTE age5num = number(age5str, F2.0)

VARIABLE LABELS age5num 'Age 5 num'.

MISSING VALUES age5num(99).
VALUE LABELS age5num
   1 '18-19'   2 '20-24'
   3 '25-29'   4 '30-34'
   5 '35-39'   6 '40-44'
   7 '45-49'   8 '50-54'
   9 '55-59'  10 '60-64'
  11 '65-69'  
  12 '70-98'.

  
CROSSTABS 
	/TABLES=age5str	age5num BY	 age1, age2, age1recode1
	/FORMAT=AVALUE TABLES PIVOT
	/CELLS=COUNT
	.
	
*	/STATISTICS=CHISQ
*	/CELLS=COUNT ROW COLUMN TOTAL.

frequencies
 /variables =  age5str age5num age1 age2 age1recode1 
 .
             
*  /order variable.

EXECUTE.
  
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
          		   .
* /statistics = mean stddev variance min max semean kurtosis skewness.

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
                   .
                   
* /plot boxplot histogram   
* /percentiles(5,10,25,50,75,90,95,99).

EXECUTE.


Title "Frequencies using recoded datasets".

frequencies
 /variables = date district district_vote 
                   q7 q8 q9_1 q9_2 q9_3 q9_4 q9_5 q9_6 
                   R1 R2 R3 R4 R5 R6 R7 R7a R8 
                   v2a v2 v3 v4 
                   sex age1 age2 edu type housing occ income mid
                   age1recode1                
  /order variable.

* /barchart


*/format dfreq
*/format=avalue table
* all
*/variables=date to age1recode1
* /drop = 
* /keep = 
* no caseid ...

EXECUTE.

* data dict. -------------------------


* caseid

* date 			- this is rolling survey and hence the date of survey I supposed

* district 		- S3: where you live (19 districts) 
* 					  	[S3] 請問你住響邊區呢？

* district_vote - S4: which district you vote 
* 					  	[S4] 咁你係咪即係XXX【根據S3答案 (下面自動選擇)】 區既登記選民呢？【如對，按下題】如果唔係，咁你係屬於邊一區既登記選民呢？【讀出其他4個答案，改選另一答案】

* q7 			- LC1: know about LegCo 
*				       	[LC1] 你知唔知今年有冇立法會選舉進行? (若被訪者答「知道」, 訪問員請追問: "咁係幾時舉行? "，如對方可答出於今年9月9日舉行 或 只能答出 "九月"，都歸納為 "答對")
* q8 			- LC2: strategic voting
* 						[LC2] 如果你支持既派別向選民發出一 d 配票指示，例如按照你既身分證號碼或者出生日期去選擇同一派別既不同名單，你會唔會照做？[all answers skip to Part C]

* q9_1 			- LC3-8 ?1: economic policy
*					[LC3-8] 假設你明日去投票選立法會議員，你會有幾重視候選人提出既經濟政策？

* q9_2 			- LC3-8 ?2: political orientation
*					[LC3-8] 假設你明日去投票選立法會議員，你會有幾重視候選人提出既政治訴求？

* q9_3 			- LC3-8 ?3: livelihood policy 
*					[LC3-8] 假設你明日去投票選立法會議員，你會有幾重視候選人提出既民生政策？

* q9_4 			- LC3-8 ?4: Central Gov. relationship
*					[LC3-8] 假設你明日去投票選立法會議員，你會有幾重視候選人提出既同中央政府既關係？

* q9_5 			- LC3-8 ?5: famous
*					[LC3-8] 假設你明日去投票選立法會議員，你會有幾重視候選人提出既知名度？

* q9_6 			- LC3-8 ?6: experience as councillors 
*					[LC3-8] 假設你明日去投票選立法會議員，你會有幾重視候選人提出既係議會既資歷？

* R1			- LC9-R1   : will vote?
*					[LC9-R1] 今年既立法會選舉將在9月9日舉行，請問你會唔會去投票？（訪問員追問程度）

* R2			- LC10-R2  : which election list to support (HK Island)
*					[LC10-R2] 係黎緊既立法會地區直選有以下名單參選，你傾向支持邊張名單呢？

* R3			- LC11-R3  : -ditto- (Kowloon West)
*					[LC11-R3] 係黎緊既立法會地區直選有以下名單參選，你傾向支持邊張名單呢？

* R4			- LC12-R4  : -ditto- (Kowloon East)
*					[LC11-R4] 係黎緊既立法會地區直選有以下名單參選，你傾向支持邊張名單呢？

* R5			- LC13-R5  : -ditto- (NT West)
*					[LC11-R5] 係黎緊既立法會地區直選有以下名單參選，你傾向支持邊張名單呢？

* R6			- LC14-R6  : -ditto- (NT East)
*					[LC11-R6] 係黎緊既立法會地區直選有以下名單參選，你傾向支持邊張名單呢？

* R7			- LC15-R7  : "Super" District Council FC
*					[LC15-R7] (問所有人) 請問你係唔係區議會(二) 功能界別，俗稱「超級區議會」既登記選民呢？

* R7a			- LC15-R7a : "Super" DC registered voters?
*					[LC15-R7a] 咁你係唔係其他功能界別選民？

* R8 			- LC16-R8  : which election list to support ("Super" DC FC)
*					[LC16-R8] 假如你可以係 黎緊既區議會(二) 功能界別，俗稱「超級區議會」選舉中投票，而此界別有以下名單參選，你傾向支持邊張名單呢？

* v2a			- LC21  : vote last year district council ?
*					[LC21] (只問登記選民)請問你係舊年區議會選舉中有冇投票呢？

* v2			- LC21a : vote 2008 LegCo?
*					[LC21a] 請問你係 2008 年立法會選舉中有冇投票呢？

* v3			- LC22  : vote in any past district/regional/legco elections?
*					[LC22] 你係其他過往既各級議會選舉中有冇投過票？

* v4 			- LC23  : political orientation
*					[LC23] 你認為自己既政治取向，係傾向認同邊一個派別呢?

* sex 			- DM1  : (more female; have to check with the 
*					[DM1] 性別
							-hk population and 
							- voter register stat.?)
* age1			- DM2  : exact age at the time of survey 
*					[DM2] 年齡 (準確數字）
							- (it change :-)
							- (see below for the age1recode) 
* age2 			- DM2a : not answering exact age (16.9% not telling)
*					[DM2a] 【只問不肯透露準確年齡被訪者】請問您今年幾多歲呢? (範圍) [訪問員可讀出範圍]
							- not sure why there is DM2c 20-24 and DM2b 30-34
* edu 			- DM3  : 
*					[DM3] 教育程度

* type 			- DM4  : self-own or rent
*					[DM4] 請問你住緊既單位係：

* housing 		- DM5  : type of housing
*					[DM5] 咁係咩類型既房屋呢？

* occ 			- DM6  : occupation type 
*					[DM6] 職位
							- (can have weight if align with census ...)
* income 		- DM6b : personal monthly income
*					[DM6b] 請問您每個月既個人收入大約係幾多呢? 請包括年終雙糧及花紅。

* mid			- DM7  : class !!!
*					[DM7] 你認為你既家庭屬於以下邊個階級?(讀出首五項答案)

* age5num, age5str - recode age1 and age2 together to a new var 
*				(num is numeric and str is string format) to 1-5, 6-10 etc.
                   
