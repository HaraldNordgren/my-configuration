#!/usr/bin/env python2

import ConfigParser

config = ConfigParser.ConfigParser()
config.read("configurationFile.ini")

for section in config.sections():
    for key in config.options(section):
        if config.get(section, key) != config.get('DEFAULT', key):
            print key + " of " + section + " differs from default"
