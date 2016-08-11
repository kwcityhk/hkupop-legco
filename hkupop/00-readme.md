### download from http://data.hkupop.hku.hk/hkupop/lc_election/ch.html

### optionally clean up all the files

1. add lines to remove files under LC2016_final_2016-00-clean.bat

#### split the files

1. add    D:\hkupop-legco\hkupop\source-spss\LC2016_final_2016_01_split-080#_080#.sps #### copy similar
2. add    the output_20160#0#_0#0# directory
3. update        D:\hkupop-legco\hkupop\LC2016_final_2016-01-split.bat

4. Run-by-system D:\hkupop-legco\hkupop\LC2016_final_2016-01-split.bat
5. Check the result that files split ok

#### merge the files, so far only windows work due to addfile no locale

a. update D:\hkupop-legco\hkupop\source-spss\LC2016_final_2016_02_addfile.sps    #### to incorporate latest addition
b. update        D:\hkupop-legco\hkupop\LC2016_final_2016-02-addfile.bat         #### to add the files

c. Run-by-system D:\hkupop-legco\hkupop\LC2016_final_2016-02-addfile.bat         #### to add the files
d. Check the result that files add ok

#### analysis using all_by_5_days

a. add    D:\hkupop-legco\hkupop\source-spss\LC2016_final_2016_03_by_5_days-0#0#_0#0#_v1_POP.sps
b. update           D:\hkupop-legco\hkupop\LC2016_final_2016-03-all-analysis.bat    #### to add one more analysis_by_5_days 
																						  ####    & all 
																						  ####    & all-minus-upto-Aug1
c. Run-by-system    D:\hkupop-legco\hkupop\LC2016_final_2016-03-all-analysis.bat    #### to add one more analysis_by_5_days

#### restart the editor from time-to-time to get the latest directory listing

#### if you need to reset the time for github to work, you may try:
####   find . -exec touch -t 201608112221 {} \;
#### note the file creation date would be affected if you move too early
#### not sure about the access datetime

