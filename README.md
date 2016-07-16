# Using hkupop-legco spss datasets

* the io link is : https://kwcityhk.github.io/hkupop-legco/
* the io link edit page is via setting (auto page) or : https://github.com/kwcityhk/hkupop-legco/generated_pages/new
* the wiki is here: https://github.com/kwcityhk/hkupop-legco/wiki

* Quick sampling

    - Assume you have install the pspp (or spss!); if not go to the section below on how to install it for mac, linux or windows
    - see a green bar, on the right see the green button
        - clone or just download the zip files
            - if you download you have to expand it
    - under the pspp-run there is a sample directory call 1-sample
        - there is a spss synatx file (a file ended with .sps)
    - run that .sps file under pspp (graphic mode or in terminal) or spss
    - use a text editor you can observe how to recode e.g. the age to group and do cross-tabulation
    - more and in-depth .sps would be found in recode and description directory; 
        especially look at to the **age5 variables (which merge age1 and age2; you need that to do your analysis)**
    - learn spss (or pspp) e.g. 
        - basic:    [http://library.columbia.edu/locations/dssc/technology/spss_write.html](http://library.columbia.edu/locations/dssc/technology/spss_write.html) and
                    [http://libguides.library.kent.edu/SPSS/home](http://libguides.library.kent.edu/SPSS/home)
        - longer:   [http://www.gla.ac.uk/media/media_212500_en.pdf](http://www.gla.ac.uk/media/media_212500_en.pdf)
                    [https://www.princeton.edu/~otorres/pubop.pdf](https://www.princeton.edu/~otorres/pubop.pdf)
                    and lots of gem in authors pages: [https://www.princeton.edu/~otorres/](https://www.princeton.edu/~otorres/)
        - details:  [http://www.spsstools.net/en/](http://www.spsstools.net/en/)
                    but better its older sites 
                    [http://legacy.spsstools.net](http://legacy.spsstools.net)

* How really to analysis it:

    - (To be updated)
    - Start to recode it first (see the recode sub-directory under pspp-run)
    - under these variables and questionaire (some information are my trying to understand it in the .sps files under recode directory)

    - Deal with frequencies
    - Crosstab, graph, plot, ...
    - Weight, non-response rate, ... issues (see issues below)??? 

    - Then ... (loop, data -> program -> statistics -> check -> analysis -> political analysis -> loop back)

* Some issues involved

    - General issues: examles http://andrewgelman.com/2016/06/24/brexit-polling-what-went-wrong/ is a good essay which you should read, in summary
            1. Survey not representative sample 
            2. Survey responses not voting intentions
            3. "Shift in attitudes during the last day";
            4. "Unpredicted patterns of voter turnout", especailly the pattern
            5. sampling variability. 
    - Having said that the prediction is not as bad, read the article
    - It is not difficult but also not easy


------------------------------------------------------------

* Purpose

    A personal study on the hkupopy web site contained Legco exit-poll and rolling survey results.

    I personally do not recommend to use csv.  One of the major obstacles of using other people's survey is the metadata e.g. what is missing data, what is the questions? what is "1" meant (M or F) etc.  TAKE AGE1 AND AGE2 as an example.  You have to combine the two togeher to form a full age group.  I knew he said they have that format as some kids may want it.  May be, but having done this kind of jobs since 1980 for academics, sorry I do not agree.  Hence, I do not even bother to find out where the .csv files are. 

    I understand SPSS is good as it is easy for non-programmer.  This will use here mainly due to availability of PSPP. 

    Still, for visualaistion and better programming language ...I would suggest something like R etc. or if you have the expensive SAS (do they have free one now, not sure).  Having said that, given the real SPSS now has python etc. languages, may be it is ok.  Not sure about the PSPP though.  SPSS is so COBOL like it is ... well, better the tools you know then the tool you don't I guess.  (Acutally after trying to do a few simple thing it turns out the easy one is easier in PSPP but not in R.  But the harder stuff is easier in SAS (at least in 1980s) and R.  

    Well, may be it is just my rusty SPSS.  Also, unlike 40 years ago, no one paid me to do this or 20 years ago, try to help others, let us see how much incentives for doing this old software.  

* Source

    The data come from : [https://www.hkupop.hku.hk/english/resources/dataset/lc/index.html](https://www.hkupop.hku.hk/english/resources/dataset/lc/index.html)

    In particular I add some checksum (sha2 under mac os x); see the .md file there for details

* Disclaimer and License

    This work has nothing to do with my work and the organisation I work in.  Absolutely nothing.

    I have no relationship with the programme or HKU related to this programme.  There is no gurantee or expectataion of any correctness etc. on its analysis.

    Any work done here is for the wider community and civil society.  It has nothing to do with politics per sec and any comment related to that would be deleted.  It is all about open data.

    For the copyright of the data, you have to refer to hkupop.  I just heard today (9 July 2016 in a seminar) from Mr Robert Chung they release the data for pubic use but do not mention the license.  You can search for that web site for that information.

    MIT License for the code and anything under my copyright

* How to use the data

    -   I will try R later, but as Mr Chung has said about PSPP (and the dataset format is in SPSS .dat), I would try this first

* PSPP installation

    -   Refer to

        [https://www.gnu.org/software/pspp/](https://www.gnu.org/software/pspp/)
		
	-	Installation under Windows 7
	
		[https://www.gnu.org/software/pspp/get.html](https://www.gnu.org/software/pspp/get.html)
		
		choose 32 bit if not sure;  64 bit might be faster; I use PSPP_0.10.1_2016-04-01_32bits (even though under Windows 7 32 bits) ()
		

    -   Installation under macOS

        under macOS, I am brave and use the latest version under El Captian 

        ```
        sudo port install pspp-devel
        ```

        - This assume you already install port, if no try the followings:
        - I do this as follows: 
            - go to [https://guide.macports.org/chunked/installing.macports.html](https://guide.macports.org/chunked/installing.macports.html)
            - find the "MacPorts download directory" and click it
            - which leads you to [https://distfiles.macports.org/MacPorts/](https://distfiles.macports.org/MacPorts/) and find the latest version
            - I use "MacPorts-2.3.4-10.11-ElCapitan.pkg"
            - you have to start a new terminal session
            - in general, you also have to do

            ```
            sudo port self-update
            ```

        - you need to install X-windows (or X-servers) and also in general X-code and its command-line options ...

    -   install under ubuntu 14.04.4 LTS desktop x64 and also ubuntu 16.04 desktop x64

		- just do this and I do NOT recommend to build from source; too many issues
	
			```
			sudo apt-get upgrade
			sudo apt-get install pspp
			```
		
		- you have to find those syntax editor and output windows; 
			hidden it even better than macOS X-server!
	
* PSPP running	

    -   As the file convention are different, you have to edit the sample jobs file directory
	
	-	Also when download from windows use the default location Github under your Document folders, otherwise it may not work
	
	-	Once again the file convention is different for different OS e.g. / vs \ and location and even home folder name is different

    -   Running Graphic (Really have to find those other two windows I am afraid)

        ```
         psppire
        ```

         (Good old days graphic; but obviously not very friendly in sharing knowledge but good to create files! See tutorial later.)

    -   Running command mode and this is how the sharing work in the longer term:

        ```
        cd pspp-run
        pspp crosstab-sample-1.sps -o crosstab-sample-1.output.pdf
        pspp crosstab-sample-1.sps -o crosstab-sample-1.output.pdf -e crosstab-sample-1.issue.txt
    
        ```

        



