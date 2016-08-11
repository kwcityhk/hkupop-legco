* so far no real output
* weighted frequency in the original SPSS dataset ... 

* check the directory is ok e.g. "D:\hkupop-legco\hkupop\" may be different

* replace all under the title 0804_0808 to the real one 0#0#_0#0#

* add a directory "D:\hkupop-legco\hkupop\output_01_split-20160804_0808\"

* three adjustments:
* -- adjust the date= and filename due to shifting (the first a bit different so delete a few lines; the last one is added)
* -- adjust the GET FILE= due to shifting
* -- adjust the GET FILE= due to shifting

* doubt check all 0#0# patterns

TITLE "------- 0804_0808 ------ "	

* assume we do not trust TEMPORARY
	
GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160804_0808_v1_POP.sav".

*The original spss file is weighted
* WEIGHT by weight.

FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
TEMPORARY.
SELECT IF date=20160804.
	SAVE OUTFILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160804_v1_POP.sav".

GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160804_0808_v1_POP.sav".

* delete 5 lines ABOVE From temporary to get file and move this line

TEMPORARY.
SELECT IF date=20160805.
	SAVE OUTFILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160805_v1_POP.sav".

GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160804_0808_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160806.
	SAVE OUTFILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160806_v1_POP.sav".

GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160804_0808_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160807.
	SAVE OUTFILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160807_v1_POP.sav".

GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160804_0808_v1_POP.sav".
TEMPORARY.
SELECT IF date=20160808.
	SAVE OUTFILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160808_v1_POP.sav".

* DUPICATE 4 lines and amend
	
TITLE "------- 0804_0808 ------".

* no effect WEIGHT OFF. as the weight is built-into the dataset
	
	
GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160804_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

* delete 4 lines and move this line	
	
GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160805_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160806_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160807_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160808_v1_POP.sav".	
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

* duplicate and amend 4 lines	
	
	
* WEIGHT BY weight need to turn on each one after GET if no weight as the dateset is weighted !!!!!
	
	

	
	

GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160804_0808_v1_POP.sav".
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	

GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160804_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

* delete 4 lines and move this line	
	
GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160805_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160806_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160807_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

GET FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160808_v1_POP.sav".	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
* duplicate 4 lines
