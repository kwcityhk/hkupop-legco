cd "/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all"

ls *.sps

pspp LC2016_final_2016-addfile.SPS                    -o output_addfile/LC2016_final_2016-addfile_v1_POP-output.pdf                    -e output_addfile/LC2016_final_2016-addfile-error.txt    
pspp LC2016_final_2016-addfile-all-analysis.SPS       -o output_addfile/LC2016_final_2016-addfile-all-analysis_v1_POP-output.pdf       -e output_addfile/LC2016_final_2016-addfile-all-analysis-error.txt 
   
pspp LC2016_final_2016-addfile-all-analysis.SPS       -o output_addfile/LC2016_final_2016-addfile-all-analysis_v1_POP-output.txt       -e output_addfile/LC2016_final_2016-addfile-all-analysis-error.txt  


pspp LC2016_final_2016-addfile-all-minus-analysis.SPS -o output_addfile/LC2016_final_2016-addfile-all-minus-analysis_v1_POP-output.pdf -e output_addfile/LC2016_final_2016-addfile-all-minus-analysis-error.txt  
pspp LC2016_final_2016-addfile-all-minus-analysis.SPS -o output_addfile/LC2016_final_2016-addfile-all-minus-analysis_v1_POP-output.txt -e output_addfile/LC2016_final_2016-addfile-all-minus-analysis-error.txt   


read -p "Press [Enter] to continue ..."
