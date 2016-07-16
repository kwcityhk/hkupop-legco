* to generate

	```
	shasum -a 256 2008-legco-exit-poll-XP2008.sav > 2008-legco-exit-poll-XP2008.sav.shasum256
	```

* to verify

	```
	shasum -c 256 2008-legco-exit-poll-XP2008.sav.shasum256 < 2008-legco-exit-poll-XP2008.sav
	```
	
=====


* all 4 files generate

	```
	shasum -a 256 2008-legco-exit-poll-XP2008.sav      > 2008-legco-exit-poll-XP2008.sav.shasum256
	shasum -a 256 2008-legco-rolling-survey-RP2008.sav > 2008-legco-rolling-survey-RP2008.sav.shasum256 
	shasum -a 256 2012-legco-exit-poll-XP2012.sav      > 2012-legco-exit-poll-XP2012.sav.shasum256 
	shasum -a 256 2012-legco-rolling-survey-RP2012.sav > 2012-legco-rolling-survey-RP2012.sav.shasum256 
	```
	
* to check all 4 files

	```
	shasum -a 256 -c 2008-legco-exit-poll-XP2008.sav.shasum256      < 2008-legco-exit-poll-XP2008.sav
	shasum -a 256 -c 2008-legco-rolling-survey-RP2008.sav.shasum256  < 2008-legco-rolling-survey-RP2008.sav
	shasum -a 256 -c 2012-legco-exit-poll-XP2012.sav.shasum256      < 2012-legco-exit-poll-XP2012.sav
	shasum -a 256 -c 2012-legco-rolling-survey-RP2012.sav.shasum256 < 2012-legco-rolling-survey-RP2012.sav
	```
	
	
