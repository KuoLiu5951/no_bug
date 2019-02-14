require "selenium-webdriver"

request_url = 'https://courses.osu.edu/psc/csosuct/EMPLOYEE/PUB/c/COMMUNITY_ACCESS.CLASS_SEARCH.GBL'
subjectName = ''

# Get these strings by clicking F12 in the web to get the HTML elements.
CATALOG_NBR_STR = 'SSR_CLSRCH_WRK_CATALOG_NBR$2'
SUBJECT_SEARCH_STR = 'SSR_CLSRCH_WRK_SUBJECT_SRCH$1'
subjectIds = []
subjectClassUnits = {}

# Read the course ids and subject name from the input file
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

# Open the firefox browser
browser = Selenium::WebDriver.for :firefox
browser.get(request_url)

subjectIds.each{ |subjectId|
  wait = Selenium::WebDriver::Wait.new(timeout: 20) # seconds
  # wait for request finished
  wait.until { browser.find_element(id: "CLASS_SRCH_WRK2_SSR_PB_CLASS_SRCH") }
  # search button
  sbtn = browser.find_element(id: 'CLASS_SRCH_WRK2_SSR_PB_CLASS_SRCH')
  subject_list = browser.find_element(id: 'SSR_CLSRCH_WRK_SUBJECT_SRCH$1')
  options = subject_list.find_elements(tag_name: 'option')
  # set the subject name like "Social Work"
  options.each { |option| option.click if option.text ==  subjectName }

  # wait.until { selected_option equal subjectName}
  wait = Selenium::WebDriver::Wait.new(timeout: 20)

  selected_option = options.map { |option| option.text if option.selected? }.join


  # get the element contains the information about the class
  class_number_input = browser.find_element(id: 'SSR_CLSRCH_WRK_CATALOG_NBR$2')
  class_number_input.clear
  numberStr = subjectId.to_s
  class_number_input.send_keys(numberStr)

  sbtn.click
  # Wait to ensure the web jumped to another page.
  wait = Selenium::WebDriver::Wait.new(timeout: 20) # seconds
  # modify search button
  wait.until { browser.find_element(id: "CLASS_SRCH_WRK2_SSR_PB_MODIFY") }
  modSearchBtn = browser.find_element(id: 'CLASS_SRCH_WRK2_SSR_PB_MODIFY')
  #  Get the number of total classes relate to that course.
  classTotalNumbers = browser.find_elements(:xpath, "//a[contains(@name,'MTG_CLASS_NBR')]").length

  index = 0

  (1..classTotalNumbers).each do
    str = "MTG_CLASS_NBR$" << index.to_s
    classNumber = browser.find_element(id: str)
    classId = classNumber.text.to_i
    classNumber.click
    wait = Selenium::WebDriver::Wait.new(timeout: 20) # seconds
    # wait until the view search results button appear
    wait.until { browser.find_element(id: "CLASS_SRCH_WRK2_SSR_PB_BACK") }
    units = browser.find_element(id: 'SSR_CLS_DTL_WRK_UNITS_RANGE')
    if subjectClassUnits.key? subjectId
      subjectClassUnits[subjectId][classId] = units.text.split(' ')[0].to_i
    else
      subjectClassUnits[subjectId] = { classId  => units.text.split(' ')[0].to_i }
    end
    puts(subjectClassUnits[subjectId])
    index += 1

    # Go back to the previous page and search again.
    backBtn = browser.find_element(id: "CLASS_SRCH_WRK2_SSR_PB_BACK")
    backBtn.click
    wait = Selenium::WebDriver::Wait.new(timeout: 20)
    wait.until { browser.find_element(id: "CLASS_SRCH_WRK2_SSR_PB_MODIFY") }
  end

  modSearchBtn = browser.find_element(id: 'CLASS_SRCH_WRK2_SSR_PB_MODIFY')
  modSearchBtn.click
}

# Create the output file that contains the classes and credits associate with each class according to the Course in the input file.
File.open("./out.txt", "w") do |f|

  subjectClassUnits.each do |key, classUnits|
    f.write("Subject: " + key.to_s)
    f.write("\n")
    classUnits.each do |k, v|
      f.write("Class " + k.to_s + ": " + v.to_s + " units")
      f.write("\n")
    end
  end
end

# Close the browser
browser.quit

