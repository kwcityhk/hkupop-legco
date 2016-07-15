* pspp 2016PR_sex_age_LC_c.hand-type.sps -o 2016PR_sex_age_LC_c.hand-type.output2.pdf -e 2016PR_sex_age_LC_c.hand-type.output2.error.txt

* SAVE OUTFILE="/Users/kwcity.hk/my-git/hkupop-legco/info.from.gov.src/2016PR_sex_age_LC_c.hand-type.sav".

GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/info.from.gov.src/2016PR_sex_age_LC_c.hand-type.sav".


WEIGHT BY frequence_weight.

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
