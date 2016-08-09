
CD "/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all"

rem SET DATASET=LC2016_final_20160731_0804_v1_POP-freq.SAV
rem ECHO $DATASET

rem LC2016_final_20160730_0803_v1_POP

pspp LC2016_final_20160730_0803_v1_POP.SPS -o output/LC2016_final_20160730_0803_v1_POP-output.pdf -e output/LC2016_final_20160730_0803_v1_POP-output-pdf-error.txt
rem read -p "Press [Enter] to continue ..."
pspp LC2016_final_20160730_0803_v1_POP.SPS -o output/LC2016_final_20160730_0803_v1_POP-output.txt -e output/LC2016_final_20160730_0803_v1_POP-output-txt-error.txt
rem read -p "Press [Enter] to continue ..."

rem LC2016_final_20160731_0804_v1_POP

pspp LC2016_final_20160731_0804_v1_POP.SPS -o output/LC2016_final_20160731_0804_v1_POP-output.pdf -e output/LC2016_final_20160731_0804_v1_POP-output-pdf-error.txt
pspp LC2016_final_20160731_0804_v1_POP.SPS -o output/LC2016_final_20160731_0804_v1_POP-output.txt -e output/LC2016_final_20160731_0804_v1_POP-output-txt-error.txt

rem LC2016_final_20160801_0805_v1_POP

pspp LC2016_final_20160801_0805_v1_POP.SPS -o output/LC2016_final_20160801_0805_v1_POP-output.pdf -e output/LC2016_final_20160801_0805_v1_POP-output-pdf-error.txt
pspp LC2016_final_20160801_0805_v1_POP.SPS -o output/LC2016_final_20160801_0805_v1_POP-output.txt -e output/LC2016_final_20160801_0805_v1_POP-output-txt-error.txt

rem LC2016_final_20160802_0806_v1_POP

pspp LC2016_final_20160802_0806_v1_POP.SPS -o output/LC2016_final_20160802_0806_v1_POP-output.pdf -e output/LC2016_final_20160802_0806_v1_POP-output-pdf-error.txt
pspp LC2016_final_20160802_0806_v1_POP.SPS -o output/LC2016_final_20160802_0806_v1_POP-output.txt -e output/LC2016_final_20160802_0806_v1_POP-output-txt-error.txt
 