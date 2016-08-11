* so far no real output
* weighted frequency in the original SPSS dataset ... 

TITLE "------ 0730_0803 ------- "	

* assume we do not trust TEMPORARY
	
GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160730_0803_v1_POP.sav".
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
TEMPORARY.
SELECT IF (date=20160730). 
	SAVE OUTFILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160730_v1_POP.sav".


	
GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160730_0803_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160731.
	SAVE OUTFILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160731_v1_POP.sav".

	
GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160730_0803_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160801.
	SAVE OUTFILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160801_v1_POP.sav".

	
GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160730_0803_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160802.
	SAVE OUTFILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160802_v1_POP.sav".

	
GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160730_0803_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160803.
	SAVE OUTFILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160803_v1_POP.sav".

* WEIGHT by weight by default
	
	
GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160730_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160731_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160801_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160802_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160803_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
* no effect here - WEIGHT off.

GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160730_0803_v1_POP.sav".
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160730_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160731_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160801_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160802_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160803_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
