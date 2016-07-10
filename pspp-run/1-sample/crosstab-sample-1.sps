* just an example

* you can run it under the graphic mode for all platforms

* to run under terminal (mac or linux)

* cd ~/my-git/hkupop-legco/pspp-run/1-sample/
* pspp crosstab-sample-1.sps -o crosstab-sample-1.output.pdf


SET WIDTH 132.

SET HEADER YES.

* get the file --------

* macOS full file name
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop.source.data/2012-legco-rolling-survey-RP2012.sav".
*
* macOS relateive file name
*  GET FILE="../../../hkupop.source.data/2012-legco-rolling-survey-RP2012.sav".
*
* Ubuntu full dfile name
*  GET FILE="/home/kwcityhk/my-git/hkupop-legco/hkupop.source.data/2012-legco-rolling-survey-RP2012.sav".
*
* Windows 7 full dfile name
*  GET FILE="C:\Users\kwcity.hk\Documents\GitHub\hkupop-legco\hkupop.source.data\2012-legco-rolling-survey-RP2012.sav".

* test run some commands ----------

Title "Crosstab before recode".

CROSSTABS 
	/TABLES= age1	BY	 age2 v4 v2a R1
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

* recode variables especially something like age ----------
	
RECODE	age1 (1 thru  5=1)  ( 6 thru 10=2) 
			(11 thru 15=3)  (16 thru 20=4)
			(21 thru 25=5)  (26 thru 30=6)
			(31 thru 35=7)  (36 thru 40=8)
			(41 thru 45=9)  (46 thru 50=10)
			(51 thru 55=11) (56 thru 60=12)
			(61 thru 65=13) (66 thru 70=14)
			(71 thru 75=15) (76 thru 80=16)
			(81 thru 98=17) (99        =99) 
			INTO age1recode.
		
VARIABLE LABELS age1recode 'Age Recoded'.

MISSING VALUES age1recode(99).
VALUE LABELS age1recode
   1 ' 1- 5'   2 ' 6-10'
   3 '11-15'   4 '16-20'
   5 '21-25'   6 '26-30'
   7 '31-35'   8 '36-40'
   9 '41-45'  10 '46-50'
  11 '51-55'  12 '56-60'
  13 '61-65'  14 '66-70'
  15 '71-75'  16 '76-80'
  17 '81+'  
  99 '99 (Missing)'.

* redo the command to check the recode is ok --------

Title "Crosstab after recode".

CROSSTABS 
	/TABLES= age1recode	BY	 v4 v2a R1
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

EXECUTE.

* save it --------

* macOS relateive file name
*  SAVE OUTFILE = "/Users/kwcity.hk/my-git/hkupop-legco/pspp-run/1-sample/crosstab-sample-2012-legco-rolling-survey-RP2012.sav".
*
* macOS relateive file name
SAVE OUTFILE = "../../pspp-run/1-sample/crosstab-sample-2012-legco-rolling-survey-RP2012.sav".
*
* Ubuntu full file name
*  SAVE OUTFILE = "/home/kwcityhk/my-git/hkupop-legco/pspp-run/1-sample/crosstab-sample-2012-legco-rolling-survey-RP2012.sav".
*
* Windows 7 full file name
*  SAVE OUTFILE = "C:\Users\kwcity.hk\Documents\GitHub\hkupop-legco\pspp-run\1-sample\crosstab-sample-2012-legco-rolling-survey-RP2012.sav".


EXECUTE.

* get it back -------------

* macOS relateive file name
*  GET FILE=" "/Users/kwcity.hk/my-git/hkupop-legco/pspp-run/1-sample/crosstab-sample-2012-legco-rolling-survey-RP2012.sav".
*
* macOS relateive file name
GET FILE="../../pspp-run/1-sample/crosstab-sample-2012-legco-rolling-survey-RP2012.sav".
*
* Ubuntu full file name
*  GET FILE="/home/kwcityhk/my-git/hkupop-legco/pspp-run/1-sample/crosstab-sample-2012-legco-rolling-survey-RP2012.sav".
*
* WIndows 7 full file name
*  GET            FILE="C:\Users\kwcity.hk\Documents\GitHub\hkupop-legco\pspp-run\1-sample\crosstab-sample-2012-legco-rolling-survey-RP2012.sav".

* do the command under the new datasets -------------

Title "Crosstab using recoded datasets".

CROSSTABS 
	/TABLES= age1recode	BY	 v4 v2a R1
	/FORMAT=AVALUE TABLES PIVOT
	/STATISTICS=CHISQ
	/CELLS=COUNT ROW COLUMN TOTAL.

EXECUTE.

* That is all folks as a sample ---------

* go to see other directory - especially the "recode" one --------------

