#!/usr/bin/python2

import sys, os
import subprocess

if len(sys.argv) != 2 and len(sys.argv) != 3:
	print "Usage: %s <image> [size]" % sys.argv[0]
	sys.exit(1)

PROFILE_NAME    = "Profile0"
SETTING_PATH    = \
        "/apps/gnome-terminal/profiles/%s/background_image" % PROFILE_NAME
CONVERT         = "convert"
GCONFTOOL       = "gconftool-2"

image	= sys.argv[1]

(basename, file_extension) = os.path.splitext(image)

trimmed_image = basename + "_trimmed" + file_extension
trim_cmd = "%s -trim %s %s" % (CONVERT, image, trimmed_image)
subprocess.call(trim_cmd, shell=True)

image = trimmed_image

if len(sys.argv) == 3:
	new_size = sys.argv[2]

	resized_image = "%s_%s%s" % (os.path.splitext(image)[0], new_size, file_extension)
	resize_cmd = "%s %s -resize %s %s" % (CONVERT, image, new_size, resized_image)
	subprocess.call(resize_cmd, shell=True)

	image = resized_image

image_abspath = os.path.abspath(image)

gconftool_cmd = "%s --type string --set %s %s" % (GCONFTOOL, SETTING_PATH, image_abspath)
subprocess.call(gconftool_cmd, shell=True)

#print gconftool_cmd
