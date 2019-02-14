# Project2: Web Scraping
Start date: 02/07/2019
## Project Description
Web scraping is about data scraping used for extracting data from websites. What our project does is given a data file which includes the OSU course numbers in a specific category and output each section number in this course and related credits.
## Requirement
     -- RubyMine
     Download and install the RubyMine IDE:
     $ sudo snap install rubymine --classic
     
     Run it:
     $ rubymine
     
     -- Geckodriver version 0.24.0
     The instruction of how to download the Geckodriver into VM and set the path is https://askubuntu.com/questions/870530/how-to-install-geckodriver-in-ubuntu 
     Warn: Instead using the first step and the second step in the answer (The version of geckodriver in the step is v0.18.0), download
     geckodriver in https://github.com/mozilla/geckodriver/releases to get the newest 0.24.0 version. And extract it by double clicking
     the file downloaded. Step 3 and step4 remain the same as the answer shows.
     
     --Firefox version 65.0
     

## Implementations Details
     Read the input data file first and get the subject name. Then the program should open the request URL in Firefox.
     Using [browser.find_element(id: 'CLASS_SRCH_WRK2_SSR_PB_CLASS_SRCH')] to search the data in the related area and set the subject name. 
     Same way to get class number,after cliking the class number we will get class total number. 
     Then we can click each section number to find the ID such as the code [browser.find_element(id: 'SSR_CLS_DTL_WRK_UNITS_RANGE')] 
     and retrive the related data.
     
     
## Meeting
     -- 02/07/2019:
     Our team discussed what is web scraping and the basic ideas. Each group member got their own jobs.
     -- 02/08/2019:
     Our team developed the structure of main program and decided to use geckodriver to extract data.
     -- 02/09/2019:
     Our team learned about the concepts of geckodriver and implement into rubymine
     --02/10/2019:
     Our code run successfully in Rubymine, but we just know all the program is graded in Ubuntu. So we needed to set up new environment and compile.
     --02/11/2019:
     Our team found some bugs while executing the program in Ubuntu and discussed how to solve it.
     --02/12/2019:
     Our team solved bug and began to finish the ReadMe file
     
## Reference
     --How to download Geckodriver (v0.24.0)
     https://github.com/mozilla/geckodriver/releases
     
     --How to set Path to Geckodriver in Ubuntu
     https://askubuntu.com/questions/870530/how-to-install-geckodriver-in-ubuntu
     
     --Some methods we find online about Selenium::WebDriver in Ruby
     https://github.com/SeleniumHQ/selenium/wiki/Ruby-Bindings
     
    
