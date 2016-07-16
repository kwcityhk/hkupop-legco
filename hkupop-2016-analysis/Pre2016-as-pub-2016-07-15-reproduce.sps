* assume location of sps files: 

* cd /Users/kwcity.hk/my-git/hkupop-legco/hkupop-2016-analysis/
* pspp Pre2016-as-pub-2016-07-15-reproduce.sps -o Pre2016-as-pub-2016-07-15-reproduce.sps.output1.pdf -e Pre2016-as-pub-2016-07-15-reproduce.sps.error1.txt

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop-2016-analysis/Pre2016-as-pub-2016-07-15.sav".
	
* ------------- weight only used for statistics -------------

TITLE "NOT BY Weight"

* WEIGHT BY weight.

* ------------------------------------------------------------

EXECUTE .

* variables we know :

* caseid -> 
* date -> date of interview: YYYYMMDD

* V1 -> registered voter
* S5 -> voting district
* 	- 1: HKi
*	- 2: Kln West
*	- 3: Kln East
*	- 4: NT West
*	- 5: NT East
*	- no missing 

* Q1 		-> HKi election list
* Q1_others -> others not in the HKi list
* Q2 		-> Kln West
* Q2_others
* Q3 		-> Kln East
* Q3_others
* Q4 		-> NT East 
* Q4_others
* Q5		-> NT West
* Q5_others

* Q6 -> registered for the super-district- council


* Q7 -> super-district-council list
* Q7_others

* Q8 ->	strategic voting inclination

* sex

* age1  <-- exact; but at least 20% answer quite in the rounding 5/0
* age2  <- grouping 
* agegp <-- value labels: 
*	- 1: 18-29 
*	- 2: 30-39
*	- 3: 40-49
*	- 4: 50-59
*	- 5: 60-69
*	- 6: 70 & + 
*	- no missing

* edu
* edugp
*	- 1: P&-
*	- 2: sec
*	- 3: U&+
*	- -99: refuse to answer
 
* occ
* occgp
*	- 1: Exec and professional
*	- 2: clerks and office worker
*	- 3: worker / labour
*	- 4: student
*	- 5: housewife
*	- 6: others
*	- -99: refuse to answer

* inclin : political inclination
*	- 1: demo
*	- 2: establishment
*	- 3: middle
*	- 8886: no inclination
*	- 8887: other parties
* 	- 8888: unknown or hard to say
*	- -99: refuse to answer

* lastlc

* income

* weight <-- this need to study how it arrives ???

* not trying this : MISSING VALUES Q1 (-99, 8880 THRU HIGH).

* example COMPUTE filter_$=(sex = 2 and age ge 25 and age le 50).

COMPUTE HKi_filter_$=(S5 = 1).
VARIABLE LABEL HKi_filter_$ 'HKi (FILTER)'.
VALUE LABELS HKi_filter_$  0 'Not HKi' 1 'HKi'.
FORMAT HKi_filter_$ (f1.0).

COMPUTE KlnW_filter_$=(S5 = 2).
VARIABLE LABEL KlnW_filter_$ 'KlnW (FILTER)'.
VALUE LABELS KlnW_filter_$  0 'Not KlnW' 1 'KlnW'.
FORMAT KlnW_filter_$ (f1.0).

COMPUTE KlnE_filter_$=(S5 = 3).
VARIABLE LABEL KlnE_filter_$ 'KlnE (FILTER)'.
VALUE LABELS KlnE_filter_$  0 'Not KlnE' 1 'KlnE'.
FORMAT KlnE_filter_$ (f1.0).

COMPUTE NTW_filter_$=(S5 = 4).
VARIABLE LABEL NTW_filter_$ 'NTW (FILTER)'.
VALUE LABELS NTW_filter_$  0 'Not NTW' 1 'NTW'.
FORMAT NTW_filter_$ (f1.0).

COMPUTE NTE_filter_$=(S5 = 5).
VARIABLE LABEL NTE_filter_$ 'NTE (FILTER)'.
VALUE LABELS NTE_filter_$  0 'Not NTE' 1 'NTE'.
FORMAT NTE_filter_$ (f1.0).

* NOTE SDC filtering and not filtering both needed; be careful

COMPUTE SDC_filter_$=(Q6 = 1).
VARIABLE LABEL SDC_filter_$ 'SDC (FILTER)'.
VALUE LABELS SDC_filter_$  0 'Not SDC' 1 'SDC'.
FORMAT SDC_filter_$ (f1.0).


EXECUTE .

* date V1 S5 Q1 Q1_others Q2 Q2_others Q3 Q3_others Q4 Q4_others Q5
* Q5_others Q6 Q7 Q7_others Q8 sex age1 age2 agegp edu edugp occ occgp inclin
* lastlc
* income

* note the district and district group is missing in this .sav and .csvy


* Remember to close and start with USE ALL.



TITLE "HKi"

USE ALL.
FILTER BY HKi_filter_$.

FREQUENCIES
	/VARIABLES= q1  
	/FORMAT=DFREQ TABLE.

FREQUENCIES
	/VARIABLES= q1  
	/MISSING=INCLUDE
	/FORMAT=DFREQ TABLE.

FREQUENCIES
	/VARIABLES= sex agegp edugp inclin occgp income 
	/MISSING=INCLUDE
	/FORMAT=AVALUE TABLE.



TITLE "KlnW"

USE ALL.
FILTER BY KlnW_filter_$.

FREQUENCIES
	/VARIABLES= q2  
	/FORMAT=DFREQ TABLE.

FREQUENCIES
	/VARIABLES= q2  
	/MISSING=INCLUDE
	/FORMAT=DFREQ TABLE.

FREQUENCIES
	/VARIABLES= sex agegp edugp inclin occgp income 
	/MISSING=INCLUDE
	/FORMAT=AVALUE TABLE.



TITLE "KlnE"

USE ALL.
FILTER BY KlnE_filter_$.

FREQUENCIES
	/VARIABLES= q3  
	/FORMAT=DFREQ TABLE.

FREQUENCIES
	/VARIABLES= q3  
	/MISSING=INCLUDE
	/FORMAT=DFREQ TABLE.

FREQUENCIES
	/VARIABLES= sex agegp edugp inclin occgp income 
	/MISSING=INCLUDE
	/FORMAT=AVALUE TABLE.



TITLE "NTW"

USE ALL.
FILTER BY NTW_filter_$.

FREQUENCIES
	/VARIABLES= q4  
	/FORMAT=DFREQ TABLE.

FREQUENCIES
	/VARIABLES= q4  
	/MISSING=INCLUDE
	/FORMAT=DFREQ TABLE.

FREQUENCIES
	/VARIABLES= sex agegp edugp inclin occgp income 
	/MISSING=INCLUDE
	/FORMAT=AVALUE TABLE.




TITLE "NTE"

USE ALL.
FILTER BY NTE_filter_$.

FREQUENCIES
	/VARIABLES= q5  
	/FORMAT=DFREQ TABLE.

FREQUENCIES
	/VARIABLES= q5  
	/MISSING=INCLUDE
	/FORMAT=DFREQ TABLE.

FREQUENCIES
	/VARIABLES= sex agegp edugp inclin occgp income 
	/MISSING=INCLUDE
	/FORMAT=AVALUE TABLE.


TITLE "SDC - bascially any one"

USE ALL.  
* filter and not filtering for Super District Council

FREQUENCIES
	/VARIABLES= q6 q7 q7_others
	/FORMAT=DFREQ TABLE.

FREQUENCIES
	/VARIABLES= q6 q7 q7_others  
	/MISSING=INCLUDE
	/FORMAT=DFREQ TABLE.

FREQUENCIES
	/VARIABLES= sex agegp edugp inclin occgp income 
	/MISSING=INCLUDE
	/FORMAT=AVALUE TABLE.


TITLE "SDC - bascially any one"

USE ALL.  
FILTER BY SDC_filter_$.

FREQUENCIES
	/VARIABLES= q6 q7 q7_others
	/FORMAT=DFREQ TABLE.

FREQUENCIES
	/VARIABLES= q6 q7 q7_others  
	/MISSING=INCLUDE
	/FORMAT=DFREQ TABLE.

FREQUENCIES
	/VARIABLES= sex agegp edugp inclin occgp income 
	/MISSING=INCLUDE
	/FORMAT=AVALUE TABLE.


USE ALL.  

* Remember to close and start with USE ALL.


FREQUENCIES
	/VARIABLES= q8 sex agegp edugp inclin occgp income 
	/FORMAT=AVALUE TABLE.

FREQUENCIES
	/VARIABLES= sex agegp edugp inclin occgp income 
	/MISSING=INCLUDE
	/FORMAT=AVALUE TABLE.





	
TITLE "== for my own understanding of the dataset"

