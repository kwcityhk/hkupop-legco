* http://data.hkupop.hku.hk/hkupop/lc_election/ch.html
* so far no real title
* weighted frequency in the original SPSS dataset ... 

TITLE "------ 0730_0803 0802_0806 ------- "	

* assume we do not trust TEMPORARY
	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/LC2016_final_20160730_0803_v1_POP.sav".
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
GET FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/LC2016_final_20160802_0806_v1_POP.sav".

FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	
WEIGHT off.
FREQUENCIES
	/VARIABLES= date
	/FORMAT=AVALUE TABLE.
	

ADD FILES FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160730_v1_POP.sav"
	     /FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160731_v1_POP.sav"
	     /FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160801_v1_POP.sav"
	     /FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160802_v1_POP.sav"
	     /FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160803_v1_POP.sav"
	     /FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160804_v1_POP.sav"
	     /FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160805_v1_POP.sav"
	     /FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160806_v1_POP.sav"
	     /FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160807_v1_POP.sav"
	.	

SAVE OUTFILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/LC2016_final_current_v1_POP.sav".

ADD FILES FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160802_v1_POP.sav"
	     /FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160730_0803/LC2016_final_20160803_v1_POP.sav"
	     /FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160804_v1_POP.sav"
	     /FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160805_v1_POP.sav"
	     /FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160806_v1_POP.sav"
	     /FILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/output_20160803_0807/LC2016_final_20160807_v1_POP.sav"
	.	



SAVE OUTFILE="/Users/kwcity.hk/my-git/hkupop-legco/hkupop_0730_start_and_all/LC2016_final_current-minus07xx0801_v1_POP.sav".



	


	
