require "selenium-webdriver"

request_url = "https://courses.osu.edu/psc/csosuct/EMPLOYEE/PUB/c/COMMUNITY_ACCESS.CLASS_SEARCH.GBL"
subjectName = ""
CATALOG_NBR_STR = "SSR_CLSRCH_WRK_CATALOG_NBR$2"
SUBJECT_SEARCH_STR = "SSR_CLSRCH_WRK_SUBJECT_SRCH$1"
subjectIds = []
subjectClassUnits = {}

#read the course ids and subject name
File.open("data.txt", "r") do |f|
    i = 0
    f.each_line do |line|
        if i == 0
            subjectName = line.strip
        else
            subjectIds << line.to_i
        end
        i += 1
    end
end

browser = Selenium::WebDriver.for :firefox
browser.get(request_url)
