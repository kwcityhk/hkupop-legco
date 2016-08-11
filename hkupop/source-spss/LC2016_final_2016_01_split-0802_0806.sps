* so far no real output
* weighted frequency in the original SPSS dataset ... 

TITLE "------- 0802_0806 ------ "	

* assume we do not trust TEMPORARY
	
GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160802_0806_v1_POP.sav".

*The original spss file is weighted
*WEIGHT OFF.

FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

TEMPORARY.
SELECT IF (date=20160802). 
	SAVE OUTFILE="D:\hkupop-legco\hkupop\output_01_split-20160802_0806\LC2016_final_20160802_v1_POP.sav".

GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160802_0806_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160803.
	SAVE OUTFILE="D:\hkupop-legco\hkupop\output_01_split-20160802_0806\LC2016_final_20160803_v1_POP.sav".

GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160802_0806_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160804.
	SAVE OUTFILE="D:\hkupop-legco\hkupop\output_01_split-20160802_0806\LC2016_final_20160804_v1_POP.sav".

GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160802_0806_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160805.
	SAVE OUTFILE="D:\hkupop-legco\hkupop\output_01_split-20160802_0806\LC2016_final_20160805_v1_POP.sav".

GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160802_0806_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160806.
	SAVE OUTFILE="D:\hkupop-legco\hkupop\output_01_split-20160802_0806\LC2016_final_20160806_v1_POP.sav".

TITLE "----- ".

* no effect WEIGHT OFF.
	
GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160802_0806\LC2016_final_20160802_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160802_0806\LC2016_final_20160803_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160802_0806\LC2016_final_20160804_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160802_0806\LC2016_final_20160805_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160802_0806\LC2016_final_20160806_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
* WEIGHT BY weight need to turn on each one after GET
	
	

	
	

GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160802_0806_v1_POP.sav".
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.


GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160802_0806\LC2016_final_20160802_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160802_0806\LC2016_final_20160803_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160802_0806\LC2016_final_20160804_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160802_0806\LC2016_final_20160805_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160802_0806\LC2016_final_20160806_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.