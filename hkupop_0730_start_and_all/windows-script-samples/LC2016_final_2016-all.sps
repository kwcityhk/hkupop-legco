WEIGHT BY weight.

FREQUENCIES
	/VARIABLES= date R1 R1gp R2 R3 R4 R5 R6 R7 R7a R8 R9 R10 sex age1 age2 agegp2
agegp45 edugp_TP occgp incomegp2 midgp district_vote
	/FORMAT=AVALUE TABLE.

FILTER OFF.	

CROSSTABS
	/TABLES= R2 R3 R4 R5 R6 R8 R10		BY	 date
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	
CROSSTABS
	/TABLES= R2 R3 R4 R5 R6 R7 R7a R8 R9 R10		BY	 agegp45
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.


	
	
FILTER OFF.	

RECODE date
	(20160804 = 1) (ELSE = 0)
	INTO date0804Filter3 .

VARIABLE LABELS date0804Filter3 "date0804Filter3".

CROSSTABS
	/TABLES= date		BY	 date0804Filter3
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.


RECODE date
	(20160805 = 1) (ELSE = 0)
	INTO date0805Filter3 .

VARIABLE LABELS date0805Filter3 "date0805Filter3".

CROSSTABS
	/TABLES= date		BY	 date0805Filter3
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.


RECODE  R1gp
	(1 = 1) (ELSE = 0)
	INTO R1gpFilter1 .

VARIABLE LABELS R1gpFilter1 "R1gpFilter1".

CROSSTABS
	/TABLES= R1gp		BY	 R1gpFilter1
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

RECODE  R7a
	(1 = 0) (ELSE = 1)
	INTO R7aFilter2 .

VARIABLE LABELS R7aFilter2 "R7aFilter2".

CROSSTABS
	/TABLES= R7a		BY	 R7aFilter2
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.


EXECUTE.

FILTER BY R1gpFilter1.

CROSSTABS
	/TABLES= R2 R3 R4 R5 R6 R9 		BY	 agegp45 R10
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

FILTER OFF.	
	
FILTER BY R7aFilter2.

CROSSTABS
	/TABLES= R8 R9 		BY	 agegp45 R10
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

FILTER OFF.	

FILTER BY R1gpFilter1.

CROSSTABS
	/TABLES= R6  		BY	 date
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

FILTER OFF.	

FILTER BY date0804Filter3 .

CROSSTABS
	/TABLES= R6  		BY	 R10
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

FILTER OFF.	

FILTER BY date0805Filter3 .

CROSSTABS
	/TABLES= R6  		BY	 R10
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

FILTER OFF.	
