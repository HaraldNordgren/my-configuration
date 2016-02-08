#!/usr/bin/env python3

import os, shutil, configparser

user_config_dir = os.path.expanduser("~") + "/.config/Nick_H"
user_config = user_config_dir + "/user_config.ini"

if not os.path.isfile(user_config):
    os.makedirs(user_config_dir, exist_ok=True)
    shutil.copyfile("default_config.ini", user_config)

config = configparser.ConfigParser()
config.read(user_config)

print(config['section']['setting_1'])
print(config['section']['setting_2'])
