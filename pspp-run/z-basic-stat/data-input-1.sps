* http://www.ats.ucla.edu/stat/spss/sk/default.htm
* http://www.ats.ucla.edu/stat/spss/notes/entering.htm

* pspp data-input-1.sps -o data-input-1.pdf -e data-input-1.issue.txt

data list list
 /id female race ses * schtype (A3) prog read write math science socst.
begin data.
 147 1 1 3 pub 1 47  62  53  53  61
 108 0 1 2 pub 2 34  33  41  36  36
  18 0 3 2 pub 3 50  33  49  44  36
 153 0 1 2 pub 3 39  31  40  39  51
  50 0 2 2 pub 2 50  59  42  53  61
  51 1 2 1 pub 2 42  36  42  31  39
 102 0 1 1 pub 1 52  41  51  53  56
  57 1 1 2 pub 1 71  65  72  66  56
 160 1 1 2 pub 1 55  65  55  50  61
 136 0 1 2 pub 1 65  59  70  63  51
end data.

DATA LIST LIST 
 / make (A15) mpg weight price .
BEGIN DATA.
"AMC Concord",22,2930,4099
"AMC Pacer",17,3350,4749
"AMC Spirit",22,2640,3799
"Buick Century",20, 3250,4816
"Buick Electra",15,4080,7827
END DATA.

LIST.

DATA LIST LIST 
 / caseid dance incentives .
BEGIN DATA.
1, 1, 2
2, 2, 1
3, 1, 2
4, 2, 1
5, 1, 1
6, 2, 1
7, 1, 1
8, 2, 1
9, 2, 2
END DATA.

crosstab dance by incentives
/statistics.

save outfile = "data-input-1.sav".

get file = "data-input-1.sav".

crosstab incentives by dance
/statistics.


LIST.


