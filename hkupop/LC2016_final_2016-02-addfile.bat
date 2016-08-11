	D:

CD "D:\hkupop-legco\hkupop"

DIR source-spss\*.SPS

PSPP source-spss\LC2016_final_2016_02_addfile.SPS                    -o output_02_addfile\LC2016_final_2016-02_addfile_v1_POP-output.pdf                    -e output_02_addfile\LC2016_final_2016_02_addfile-error.txt

PSPP source-spss\LC2016_final_2016_02_addfile-all-analysis.SPS       -o output_02_addfile\LC2016_final_2016-02_addfile-all-analysis_v1_POP-output.pdf       -e output_02_addfile\LC2016_final_2016_02_addfile-all-analysis-pdf-error.txt
PSPP source-spss\LC2016_final_2016_02_addfile-all-analysis.SPS       -o output_02_addfile\LC2016_final_2016-02_addfile-all-analysis_v1_POP-output.txt       -e output_02_addfile\LC2016_final_2016_02_addfile-all-analysis-txt-error.txt

type output_02_addfile\LC2016_final_2016_02_addfile-all-analysis-pdf-error.txt
type output_02_addfile\LC2016_final_2016_02_addfile-all-analysis-txt-error.txt

PSPP source-spss\LC2016_final_2016_02_addfile-all-minus-analysis.SPS -o output_02_addfile\LC2016_final_2016-02_addfile-all-minus-analysis_v1_POP-output.pdf -e output_02_addfile\LC2016_final_2016_02_addfile-all-minus-analysis-pdf-error.txt
PSPP source-spss\LC2016_final_2016_02_addfile-all-minus-analysis.SPS -o output_02_addfile\LC2016_final_2016-02_addfile-all-minus-analysis_v1_POP-output.txt -e output_02_addfile\LC2016_final_2016_02_addfile-all-minus-analysis-txt-error.txt

type output_02_addfile\LC2016_final_2016_02_addfile-all-minus-analysis-pdf-error.txt
type output_02_addfile\LC2016_final_2016_02_addfile-all-minus-analysis-txt-error.txt

pause