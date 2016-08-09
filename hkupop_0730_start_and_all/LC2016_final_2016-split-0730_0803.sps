* so far no real output
* weighted frequency in the original SPSS dataset ... 

TITLE "------ 0730_0803 ------- "	

* assume we do not trust TEMPORARY
	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/LC2016_final_20160730_0803_v1_POP.sav".
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
TEMPORARY.
SELECT IF (date=20160730). 
	SAVE OUTFILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160730_v1_POP.sav".


	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/LC2016_final_20160730_0803_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160731.
	SAVE OUTFILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160731_v1_POP.sav".

	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/LC2016_final_20160730_0803_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160801.
	SAVE OUTFILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160801_v1_POP.sav".

	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/LC2016_final_20160730_0803_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160802.
	SAVE OUTFILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160802_v1_POP.sav".

	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/LC2016_final_20160730_0803_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160803.
	SAVE OUTFILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160803_v1_POP.sav".

* WEIGHT by weight by default
	
	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160730_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160731_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160801_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160802_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160803_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
* no effect here - WEIGHT off.

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/LC2016_final_20160730_0803_v1_POP.sav".
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160730_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160731_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160801_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160802_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160803_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
