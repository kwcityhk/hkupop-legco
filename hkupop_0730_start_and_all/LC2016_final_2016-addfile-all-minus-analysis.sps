GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/LC2016_final_current-minus07xx0801_v1_POP.sav".

WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.	
	
WEIGHT by weight.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

	
CROSSTABS
	/TABLES= R2 R3 R4 R5 R6 R7 R7a R8 R9 R10		BY	 agegp45
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

CROSSTABS
	/TABLES= R2 R3 R4 R5 R6 R8 R10		BY	 date
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ

	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.	
	
	
CROSSTABS
	/TABLES= R2 R3 R4 R5 R6 R7 R7a R8 R9 R10		BY	 agegp45
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

CROSSTABS
	/TABLES= R2 R3 R4 R5 R6 R8 R10		BY	 date
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ

CROSSTABS
	/TABLES= date BY	 R2 R3 R4 R5 R6 R8 R10		
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ

WEIGHT by weight.	
CROSSTABS
	/TABLES= date BY	 R2 R3 R4 R5 R6 R8 R10		
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	
CROSSTABS
	/TABLES= date BY	 R2 R3 R4 R5 R6 R8 R10		
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ 	
    /CELLS=COUNT ROW COLUMN TOTAL
    
WEIGHT BY weight.

CROSSTABS
	/TABLES= R10	BY	 R2
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.
