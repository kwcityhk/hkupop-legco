* assume location of sps files: 

* cd /Users/kwcity.hk/my-git/hkupop-legco/hkupop-2016-analysis/
* pspp Pre2016-as-pub-2016-07-15.sps -o Pre2016-as-pub-2016-07-15.sps.output3.pdf -e Pre2016-as-pub-2016-07-15.sps.error3.txt

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop-2016-analysis/Pre2016-as-pub-2016-07-15.sav".

TITLE "==NOT== BY Weight"

TITLE "==  == MISSING VALUE likely just -99 or likely BLANK"

FREQUENCIES
	/VARIABLES= date V1 S5 Q1 Q1_others Q2 Q2_others Q3 Q3_others Q4 Q4_others Q5
Q5_others Q6 Q7 Q7_others Q8 sex age1 age2 agegp edu edugp occ occgp inclin
	/FORMAT=DFREQ TABLE.

TITLE "==INCLUDE MISSING == MISSING VALUE likely -99 and BLANK"

FREQUENCIES
	/VARIABLES= date V1 S5 Q1 Q1_others Q2 Q2_others Q3 Q3_others Q4 Q4_others Q5
Q5_others Q6 Q7 Q7_others Q8 sex age1 age2 agegp edu edugp occ occgp inclin
lastlc income
	/MISSING=INCLUDE
	/FORMAT=DFREQ TABLE.
	
* ---------------------------

WEIGHT BY weight.

* -----------------------------

TITLE "BY Weight"

TITLE "--  -- MISSING VALUE likely just -99 or likely BLANK"

FREQUENCIES
	/VARIABLES= date V1 S5 Q1 Q1_others Q2 Q2_others Q3 Q3_others Q4 Q4_others Q5
Q5_others Q6 Q7 Q7_others Q8 sex age1 age2 agegp edu edugp occ occgp inclin
	/FORMAT=DFREQ TABLE.

* fail to try different "missing values"
*TITLE "-- NOT INCLUDE MISSING -- MISSING VALUE seems to be -99, 8885 to 8888 note got 101 as others use 8880+"
* missing values has to define separately for string and numeric variables (see variable view) cannot use ALL
* MISSING VALUES date V1 S5 Q1 Q2  Q3  Q4  Q5 Q6 Q7 Q8 sex age1 age2 agegp edu edugp occ occgp inclin (-99, 8880 THRU HIGH).
* not sure about blank ??? but cannot use THRU and cannot use more than 3
* MISSING VALUES Q1_others Q2_others  Q3_others  Q4_others  Q5_others  Q7_others ("-99", "8885", "8886", "8887", "8888").

TITLE "--INCLUDE MISSING -- MISSING VALUE likely -99 and BLANK"

FREQUENCIES
	/VARIABLES= date V1 S5 Q1 Q1_others Q2 Q2_others Q3 Q3_others Q4 Q4_others Q5
Q5_others Q6 Q7 Q7_others Q8 sex age1 age2 agegp edu edugp occ occgp inclin
lastlc income
	/MISSING=INCLUDE
	/FORMAT=DFREQ TABLE.
