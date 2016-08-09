* so far no real output
* weighted frequency in the original SPSS dataset ... 

TITLE "------- 0803_0807 ------ "	

* assume we do not trust TEMPORARY
	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/LC2016_final_20160803_0807_v1_POP.sav".

*The original spss file is weighted
*WEIGHT OFF.

FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

TEMPORARY.
SELECT IF date=20160803.
	SAVE OUTFILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160803_v1_POP.sav".

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/LC2016_final_20160803_0807_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160804.
	SAVE OUTFILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160804_v1_POP.sav".

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/LC2016_final_20160803_0807_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160805.
	SAVE OUTFILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160805_v1_POP.sav".

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/LC2016_final_20160803_0807_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160806.
	SAVE OUTFILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160806_v1_POP.sav".

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/LC2016_final_20160803_0807_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160807.
	SAVE OUTFILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160807_v1_POP.sav".

	
TITLE "----- ".

* no effect WEIGHT OFF.
	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160803_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160804_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160805_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160806_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160807_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

	
* WEIGHT BY weight need to turn on each one after GET
	
	

	
	

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/LC2016_final_20160803_0807_v1_POP.sav".
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.


GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160803_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160804_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160805_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160806_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160807_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
