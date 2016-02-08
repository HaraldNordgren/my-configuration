#!/usr/bin/env python3

import splinter

browser = splinter.Browser()
browser.visit("http://pict.ethdigitalcampus.com/PICT/")

button = browser.find_by_xpath("//input[@value='Sign In']")

