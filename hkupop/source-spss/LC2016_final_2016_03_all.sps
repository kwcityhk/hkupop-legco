* add recode and ...    


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

FILTER OFF.	
	
CROSSTABS
	/TABLES= R2 R3 R4 R5 R6 R7 R7a R8 R9 R10		BY	 agegp45
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

* record variables
* the file should have all dates
	
FILTER OFF.	


RECODE date
	          (201600730 = 1) (ELSE = 0)
	INTO        date0730Filter.

VARIABLE LABELS date0730Filter "date0730Filter".

RECODE date
	          (201600731 = 1) (ELSE = 0)
	INTO        date0731Filter.

VARIABLE LABELS date0731Filter "date0731Filter".


RECODE date
	          (201600801 = 1) (ELSE = 0)
	INTO        date0801Filter.

VARIABLE LABELS date0801Filter "date0801Filter".

RECODE date
	          (201600802 = 1) (ELSE = 0)
	INTO        date0802Filter.

VARIABLE LABELS date0802Filter "date0802Filter".

RECODE date
	          (201600803 = 1) (ELSE = 0)
	INTO        date0803Filter.

VARIABLE LABELS date0803Filter "date0803Filter".

RECODE date
	          (201600804 = 1) (ELSE = 0)
	INTO        date0804Filter.

VARIABLE LABELS date0804Filter "date0804Filter".

RECODE date
	          (201600805 = 1) (ELSE = 0)
	INTO        date0805Filter.

VARIABLE LABELS date0805Filter "date0805Filter".

RECODE date
	          (201600806 = 1) (ELSE = 0)
	INTO        date0806Filter.

VARIABLE LABELS date0806Filter "date0806Filter".

RECODE date
	          (201600807 = 1) (ELSE = 0)
	INTO        date0807Filter.

VARIABLE LABELS date0807Filter "date0807Filter".

RECODE date
	          (201600808 = 1) (ELSE = 0)
	INTO        date0808Filter.

VARIABLE LABELS date0808Filter "date0808Filter".

* -act- add recode variables change 4 ... 4 places --- above this line ---


CROSSTABS
	/TABLES= date		BY	 date0730Filter
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

CROSSTABS
	/TABLES= date		BY	 date0731Filter
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

	
CROSSTABS
	/TABLES= date		BY	 date0801Filter
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

CROSSTABS
	/TABLES= date		BY	 date0802Filter
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

CROSSTABS
	/TABLES= date		BY	 date0803Filter
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

CROSSTABS
	/TABLES= date		BY	 date0804Filter
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

CROSSTABS
	/TABLES= date		BY	 date0805Filter
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

CROSSTABS
	/TABLES= date		BY	 date0806Filter
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

CROSSTABS
	/TABLES= date		BY	 date0807Filter
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

CROSSTABS
	/TABLES= date		BY	 date0808Filter
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.
	
* -act- add crosstab for checking change 1 ... 1 places --- above this line ---

	
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

FILTER BY date0807Filter .

CROSSTABS
	/TABLES= R6  		BY	 R10
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

FILTER OFF.	

FILTER BY date0808Filter .

CROSSTABS
	/TABLES= R6  		BY	 R10
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

FILTER OFF.	

CROSSTABS
	/TABLES= date  		BY	 R2 R3 R4 R5 R6 R7 R7a R8 R9 R10
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.


* -- act move the CROSSTAB for checking results --- delete one and add one say ----