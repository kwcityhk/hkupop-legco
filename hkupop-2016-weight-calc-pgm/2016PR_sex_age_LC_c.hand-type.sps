* cd /Users/kwcity.hk/my-git/hkupop-legco/info.from.gov.src/
* pspp 2016PR_sex_age_LC_c.hand-type.sps -o 2016PR_sex_age_LC_c.hand-type.sps.output5.pdf -e 2016PR_sex_age_LC_c.hand-type.sps.error5.txt

* SAVE OUTFILE="/Users/kwcity.hk/my-git/hkupop-legco/info.from.gov.src/2016PR_sex_age_LC_c.hand-type.data.sav".

* use .csv and conver using PSS
* - typing :-) with some checksum in excel
* - generate .csv
* - tidy up the .csv file using editor
* - get into pspp using import ... note 1st line be variable should be click
* - edit the var definition especially the string one
* - import

* here is to get it back and check the result

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/info.from.gov.src/2016PR_sex_age_LC_c.hand-type.data.sav".

WEIGHT BY frequence_weight.

FREQUENCIES
	/VARIABLES= sex district age_group
	/FORMAT=AVALUE TABLE.

CROSSTABS
	/TABLES= sex BY  district By  age_group	
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT 

*/CELLS=COUNT EXPECTED SRESID PROP


*CROSSTABS
*	/TABLES= age_group	BY sex BY	 district
*	/FORMAT=AVALUE TABLES PIVOT
*	/STATISTICS=CHISQ
*	/CELLS=COUNT 
	
* ROW COLUMN TOTAL.
