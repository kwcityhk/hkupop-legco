cd "/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all"

ls *.sps

pspp LC2016_final_2016-split-0730_0803.SPS -o output_20160730_0803/LC2016_final_2016-split-0730_0803_v1_POP-output.pdf -e output_20160730_0803/LC2016_final_2016-split-0730_0803-error.txt  
pspp LC2016_final_2016-split-0731_0804.SPS -o output_20160731_0804/LC2016_final_2016-split-0731_0804_v1_POP-output.pdf -e output_20160731_0804/LC2016_final_2016-split-0731_0804-error.txt  
pspp LC2016_final_2016-split-0801_0805.SPS -o output_20160801_0805/LC2016_final_2016-split-0801_0805_v1_POP-output.pdf -e output_20160801_0805/LC2016_final_2016-split-0801_0805-error.txt  
pspp LC2016_final_2016-split-0802_0806.SPS -o output_20160802_0806/LC2016_final_2016-split-0802_0806_v1_POP-output.pdf -e output_20160802_0806/LC2016_final_2016-split-0802_0806-error.txt  
pspp LC2016_final_2016-split-0803_0807.SPS -o output_20160803_0807/LC2016_final_2016-split-0803_0807_v1_POP-output.pdf -e output_20160803_0807/LC2016_final_2016-split-0803_0807-error.txt  

read -p "Press [Enter] to continue ..."
