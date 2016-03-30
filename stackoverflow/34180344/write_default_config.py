#!/usr/bin/env python2

import ConfigParser

config = ConfigParser.ConfigParser()

config.set('DEFAULT', 'key1', "value1")
config.set('DEFAULT', 'key2', "value2")
config.set('DEFAULT', 'key3', "value3")

config.add_section('Section2')
config.set('Section2', 'key1', "value5")
config.set('Section2', 'key2', "value2")

with open("configurationFile.ini", 'w') as f:
    config.write(f)
