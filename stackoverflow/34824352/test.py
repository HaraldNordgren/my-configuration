#!/usr/bin/env python3

import splinter

browser = splinter.Browser()
browser.visit("http://www.echoecho.com/htmlforms11.htm")

menu = browser.find_by_xpath("//select[@name='dropdownmenu']")
print(menu)

for option in menu.find_by_tag('option'):

    if option.text == "Cheese":
        option.click()
        break

print("Done")
