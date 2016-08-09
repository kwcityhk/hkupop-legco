cd "/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all"

ls *.sps

* pspp --syntax-encoding={LOCATE,'windows-1252'} LC2016_final_2016-addfile.SPS                    -o output_addfile/LC2016_final_2016-addfile_v1_POP-output.pdf                    -e output_addfile/LC2016_final_2016-addfile-error.txt    
* pspp --syntax-encoding=UTF8 LC2016_final_2016-addfile.SPS 
* pspp-dump-sav (and check the last few line)
* the saving or add file has switch to UNICODE to ASCII which is not possible with CHinese char.
* need fixing

pspp  LC2016_final_2016-addfile-all-analysis.SPS       -o output_addfile/LC2016_final_2016-addfile-all-analysis_v1_POP-output.pdf       -e output_addfile/LC2016_final_2016-addfile-all-analysis-error.txt 
pspp  LC2016_final_2016-addfile-all-analysis.SPS       -o output_addfile/LC2016_final_2016-addfile-all-analysis_v1_POP-output.txt       -e output_addfile/LC2016_final_2016-addfile-all-analysis-error.txt  

pspp  LC2016_final_2016-addfile-all-minus-analysis.SPS -o output_addfile/LC2016_final_2016-addfile-all-minus-analysis_v1_POP-output.pdf -e output_addfile/LC2016_final_2016-addfile-all-minus-analysis-error.txt  
pspp  LC2016_final_2016-addfile-all-minus-analysis.SPS -o output_addfile/LC2016_final_2016-addfile-all-minus-analysis_v1_POP-output.txt -e output_addfile/LC2016_final_2016-addfile-all-minus-analysis-error.txt   

pspp  LC2016_final_2016-addfile-all-wong.SPS       -o output_addfile/LC2016_final_2016-addfile-all-wong_v1_POP-output.pdf       -e output_addfile/LC2016_final_2016-addfile-all-wong-error.txt  
pspp  LC2016_final_2016-addfile-all-wong.SPS       -o output_addfile/LC2016_final_2016-addfile-all-wong_v1_POP-output.txt       -e output_addfile/LC2016_final_2016-addfile-all-wong-error.txt  


read -p "Press [Enter] to continue ..."
