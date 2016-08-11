* 1. add a section every 5 days for cross-checking
* 2.
* 3. amend filenames

* http://data.hkupop.hku.hk/hkupop/lc_election/ch.html
* so far no real title
* weighted frequency in the original SPSS dataset ... 

TITLE "------ 0730_0803 0802_0806 ------- "	

* assume we do not trust TEMPORARY
	
GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160730_0803_v1_POP.sav".
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="D:\hkupop-legco\hkupop\data-raw\LC2016_final_20160804_0808_v1_POP.sav".

FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.

* add section every 5 days	from get file to 2 fequences with weight or not weight

ADD FILES FILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160730_v1_POP.sav"
	     /FILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160731_v1_POP.sav"
	     /FILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160801_v1_POP.sav"
	     /FILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160802_v1_POP.sav"
	     /FILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160803_v1_POP.sav"
	     /FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160804_v1_POP.sav"
	     /FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160805_v1_POP.sav"
	     /FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160806_v1_POP.sav"
	     /FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160807_v1_POP.sav"
	     /FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160808_v1_POP.sav"
	.	

* add files per day	and add section every 5 days
	
SAVE OUTFILE="D:\hkupop-legco\hkupop\data-generated\LC2016_final_current_v1_POP.sav".

* not adding the 0730 to 0802

ADD FILES FILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160802_v1_POP.sav"
	     /FILE="D:\hkupop-legco\hkupop\output_01_split-20160730_0803\LC2016_final_20160803_v1_POP.sav"
	     /FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160804_v1_POP.sav"
	     /FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160805_v1_POP.sav"
	     /FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160806_v1_POP.sav"
	     /FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160807_v1_POP.sav"
	     /FILE="D:\hkupop-legco\hkupop\output_01_split-20160804_0808\LC2016_final_20160808_v1_POP.sav"
	.	

* add files per day and add section every 5 days

SAVE OUTFILE="D:\hkupop-legco\hkupop\data-generated\LC2016_final_current-minus07xx0801_v1_POP.sav".



	


	
