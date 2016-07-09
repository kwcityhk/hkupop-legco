# Using hkupop-legco spss datasets

* Quick sampling

    - Assume you have install the pspp (or spss!)
    - see a green bar, on the right see the green button
        - clone or just download the zip files
            - if you download you have to expand it
    - under the pspp-run there is a sample spss synatx file (a file ended with .sps)
    - run that .sps file under pspp or spss
    - use a text editor you can observe how to recode e.g. the age to group and do cross-tabulation
    - learn spss (or pspp)
      e.g. 
        basic:   [http://library.columbia.edu/locations/dssc/technology/spss_write.html](http://library.columbia.edu/locations/dssc/technology/spss_write.html) and
                 [http://libguides.library.kent.edu/SPSS/home](http://libguides.library.kent.edu/SPSS/home)
        details: [http://www.spsstools.net/en/](http://www.spsstools.net/en/)
                 but better its older sites [http://legacy.spsstools.net](http://legacy.spsstools.net)

------------------------------------------------------------

* Purpose

    A personal study on the hkupopy web site contained Legco exit-poll and rolling survey results.

    I personally do not recommend to use csv.  One of the major obstacles of using other people's survey is the metadata e.g. what is missing data, what is the questions? what is "1" meant (M or F) etc.  He said they have that format as some kids may want it.  May be, but having done this kind of jobs since 1980 for academics, I do not bother to find out where is the csv. 

    I do not recommend to use SPSS as once you go into visualaistion and ... R etc. or if you have the expensive SAS (do they have free one now, not sure).  Still SPSS .dat format is very common and given we have PSPP, it is ok.

    Well, rusty SPSS and unlike 40 years ago, no one paid me to do this or 20 years helping others, let us see.  

* Source

    The data come from : [https://www.hkupop.hku.hk/english/resources/dataset/lc/index.html](https://www.hkupop.hku.hk/english/resources/dataset/lc/index.html)

    In particular I add some checksum (sha2 under mac os x); see the .md file there for details

* Disclaimer and License

    I have no relationship with the programme or HKU related to this programme.  There is no gurantee or expectataion of any correctness etc. on its analysis.

    For the copyright of the data, you have to refer to hkupop.  I just heard today (9 July 2016 in a seminar) from Mr Robert Chung they release the data for pubic use but do not mention the license.  You can search for that web site for that information.

    MIT License for the code and anything under my copyright

* How to use the data

    -   I will try R later, but as Mr Chung has said about PSPP (and the dataset format is in SPSS .dat), I would try this first

* PSPP way

    -   Refer to

        [https://www.gnu.org/software/pspp/](https://www.gnu.org/software/pspp/)

    -   Installation

        under mac, I am brave and use the latest version under El Captian 

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

        - you need to install X-windows and also in general X-code and its command-line options ...

    -   Running Graphic

        ```
         psppire
        ```

         (Good old days graphic; but obviously not very friendly in sharing knowledge but good to create files! See tutorial later.)

    -   Running command mode and this is how the sharing work in the longer term:

        ```
        cd pspp-run
        pspp crosstab-sample-1.sps -o crosstab-sample-1.output.pdf
    
        ```

        



