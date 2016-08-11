REM to add one line per new dataset from HKUPOP 
REM amend the type commands
REM check the 0#0#_0#0# patterns

REM also check the directory name where you put your files i.e. "D:\hkupop-legco\hkupop"
REM amend to kicking github by touching (and if specified before day touch can even amend creation day, be careful)

D:

CD "D:\hkupop-legco\hkupop"

DIR *.SPS

REM Need to adjust the system path to include where you have installed PSPP

PSPP source-spss\LC2016_final_2016_01_split-0730_0803.SPS -o output_01_split-20160730_0803\LC2016_final_2016_01_split-0730_0803_v1_POP-output.pdf -e output_01_split-20160730_0803\LC2016_final_2016_01_split-0730_0803-error.txt
PSPP source-spss\LC2016_final_2016_01_split-0731_0804.SPS -o output_01_split-20160731_0804\LC2016_final_2016_01_split-0731_0804_v1_POP-output.pdf -e output_01_split-20160731_0804\LC2016_final_2016_01_split-0731_0804-error.txt
PSPP source-spss\LC2016_final_2016_01_split-0801_0805.SPS -o output_01_split-20160801_0805\LC2016_final_2016_01_split-0801_0805_v1_POP-output.pdf -e output_01_split-20160801_0805\LC2016_final_2016_01_split-0801_0805-error.txt
PSPP source-spss\LC2016_final_2016_01_split-0802_0806.SPS -o output_01_split-20160802_0806\LC2016_final_2016_01_split-0802_0806_v1_POP-output.pdf -e output_01_split-20160802_0806\LC2016_final_2016_01_split-0802_0806-error.txt
PSPP source-spss\LC2016_final_2016_01_split-0803_0807.SPS -o output_01_split-20160803_0807\LC2016_final_2016_01_split-0803_0807_v1_POP-output.pdf -e output_01_split-20160803_0807\LC2016_final_2016_01_split-0803_0807-error.txt
PSPP source-spss\LC2016_final_2016_01_split-0804_0808.SPS -o output_01_split-20160804_0808\LC2016_final_2016_01_split-0804_0808_v1_POP-output.pdf -e output_01_split-20160804_0808\LC2016_final_2016_01_split-0804_0808-error.txt

rem duplicate and amend 1 line above

type output_01_split-20160804_0808\LC2016_final_2016_01_split-0804_0808-error.txt

rem amend this line and btw should be zero bytes

pause