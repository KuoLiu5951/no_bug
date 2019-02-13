require "selenium-webdriver"

request_url = 'https://courses.osu.edu/psc/csosuct/EMPLOYEE/PUB/c/COMMUNITY_ACCESS.CLASS_SEARCH.GBL'
subjectName = ''
CATALOG_NBR_STR = 'SSR_CLSRCH_WRK_CATALOG_NBR$2'
SUBJECT_SEARCH_STR = 'SSR_CLSRCH_WRK_SUBJECT_SRCH$1'
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

subjectIds.each{ |subjectId|
  wait = Selenium::WebDriver::Wait.new(timeout: 30) # seconds
  #wait for request finished
  wait.until { browser.find_element(id: "CLASS_SRCH_WRK2_SSR_PB_CLASS_SRCH") }
  #search button
  sbtn = browser.find_element(id: 'CLASS_SRCH_WRK2_SSR_PB_CLASS_SRCH')
  subject_list = browser.find_element(id: 'SSR_CLSRCH_WRK_SUBJECT_SRCH$1')
  options = subject_list.find_elements(tag_name: 'option')
  # set the subject name like "Social Work"
  options.each { |option| option.click if option.text ==  subjectName }
  wait = Selenium::WebDriver::Wait.new(timeout: 30)

  selected_option = options.map { |option| option.text if option.selected? }.join

  # wait.until { selected_option eql subjectName}
  # get the class number text inputbox input
  class_number_input = browser.find_element(id: 'SSR_CLSRCH_WRK_CATALOG_NBR$2')
  class_number_input.clear
  numberStr = subjectId.to_s
  class_number_input.send_keys(numberStr)
  # class_number_input.execute_script(
  #     "document.getElementById('SSR_CLSRCH_WRK_CATALOG_NBR$2').setAttribute('value', arguments[0])",
  #     subjectId)
  sbtn.click
  wait = Selenium::WebDriver::Wait.new(timeout: 30) # seconds
  # modify search button
  wait.until { browser.find_element(id: "CLASS_SRCH_WRK2_SSR_PB_MODIFY") }
  modSearchBtn = browser.find_element(id: 'CLASS_SRCH_WRK2_SSR_PB_MODIFY')
  #click the class number
  classTotalNumbers = browser.find_elements(:xpath, "//a[contains(@name,'MTG_CLASS_NBR')]").length

  index = 0
  (1..classTotalNumbers).each {
    str = "MTG_CLASS_NBR$" << index.to_s
    classNumber = browser.find_element(id: str)
    classId = classNumber.text.to_i
    classNumber.click
    wait = Selenium::WebDriver::Wait.new(timeout: 20) # seconds
    #until the view seach results button appear
    wait.until { browser.find_element(id: "CLASS_SRCH_WRK2_SSR_PB_BACK") }
    units = browser.find_element(id: 'SSR_CLS_DTL_WRK_UNITS_RANGE')
    if subjectClassUnits.key? subjectId
      subjectClassUnits[subjectId][classId] = units.text.split(' ')[0].to_i
    else
      subjectClassUnits[subjectId] = { classId  => units.text.split(' ')[0].to_i }
    end
    puts(subjectClassUnits[subjectId])
    index += 1
    backBtn = browser.find_element(id: "CLASS_SRCH_WRK2_SSR_PB_BACK")
    backBtn.click
    wait = Selenium::WebDriver::Wait.new(timeout: 30)
    wait.until { browser.find_element(id: "CLASS_SRCH_WRK2_SSR_PB_MODIFY") }
  }
  modSearchBtn = browser.find_element(id: 'CLASS_SRCH_WRK2_SSR_PB_MODIFY')
  modSearchBtn.click
}
File.open("./out.txt", "w") do |f|

  
end


browser.quit

