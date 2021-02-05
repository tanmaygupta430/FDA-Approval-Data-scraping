import re
import time

#Import webdriver to initialise a browser
from selenium import webdriver
from selenium.webdriver import ActionChains

# website that we want to scrap
url = "https://calendar.google.com/calendar/embed?showTitle=0&height=600&wkst=1&bgcolor=%23FFFFFF&src=evgohovm2m3tuvqakdf4hfeq84@group.calendar.google.com&color=%23711616&src=5dso8589486irtj53sdkr4h6ek@group.calendar.google.com&color=%23182C57&ctz=America/Los_Angeles"

# Initialize webdriver and put the path where download the driver
driver = webdriver.Chrome(r'C:\Users\tanma\Music\tg 2k19 Data science\prof. zhi RA\test_tasks\chromedriver.exe')

# Launch Chrome and pass the url
driver.get(url)
companies_1=[]
# Create for loop to click 60 times
for d in range(60):
    # Search for the button that allows to go back
    previous = driver.find_element_by_xpath('//*[@id="navBack1"]')
    # Make click in that button
    ActionChains(driver).click(previous).perform()
# We create a for loop to loop over each month
for d in range(60):
    # Made a list of all elements that have "day" on the id.
    list_days = driver.find_elements_by_class_name("st-bg")
    #list_days_sat= driver.find_elements_by_class_name("st-bg st-bg-fc")
    list_days_sun= driver.find_elements_by_class_name("st-bg st-bg-fc")
    #list_days = list_days.extend(list_days_sat)
    list_days = list_days.extend(list_days_sun)
    # Now I get the len of that list
    count = len(list_days)
    # Loop over each element of the list count
    for i in range(count):
        # And I get the link to the element 
        python_botton = driver.find_elements_by_class_name("st-bg")[i]
        # I will click on the day button.
        if python_botton.get_attribute('class') == "st-bg":
            ActionChains(driver).click(python_botton).perform()
            # Wait for the page to update 
            time.sleep(1)
    # When I finishing parsing the whole month, I'll move to the next month by 
    # clicking the next button
    next = driver.find_element_by_xpath('//*[@id="navForward1"]')
    # python_botton.click()
    ActionChains(driver).click(next).perform()
