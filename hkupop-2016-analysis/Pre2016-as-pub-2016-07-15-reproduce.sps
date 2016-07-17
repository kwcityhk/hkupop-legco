* assume location of sps files: 

* cd /Users/kwcity.hk/my-git/hkupop-legco/hkupop-2016-analysis/
* pspp Pre2016-as-pub-2016-07-15-reproduce.sps -o Pre2016-as-pub-2016-07-15-reproduce.sps.output-weightornot2.pdf -e Pre2016-as-pub-2016-07-15-reproduce.sps.error-weightornot2.txt

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop-2016-analysis/Pre2016-2_myWeight.sav".

TITLE "-- COMPUTE FILTER --".

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


TITLE "NOT BY Weight"

FREQUENCIES
	/VARIABLES= myWeight.

TITLE "BY Weight"

WEIGHT BY myWeight.

TITLE "NO weight - SDC - bascially any one"

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


TITLE "NO weight - SDC - bascially any one"

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



	
* ------------- weight only used for statistics -------------

TITLE "BY Weight"

FREQUENCIES
	/VARIABLES= myWeight.

WEIGHT BY weight.

* ------------------------------------------------------------

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

