* pspp Pre2016-as-pub-2016-07-15.sps -o Pre2016-as-pub-2016-07-15.output2.pdf -e Pre2016-as-pub-2016-07-15.error.txt

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop.source.data/Pre2016-as-pub-2016-07-15.sav".

WEIGHT BY weight.

FREQUENCIES
	/VARIABLES= date V1 S5 Q1 Q1_others Q2 Q2_others Q3 Q3_others Q4 Q4_others Q5
Q5_others Q6 Q7 Q7_others Q8 sex age1 age2 agegp edu edugp occ occgp inclin
lastlc income
	/FORMAT=AVALUE TABLE.

