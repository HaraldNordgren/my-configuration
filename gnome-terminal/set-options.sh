#!/bin/bash

profile=Profile0

gconftool-2 --type bool --set /apps/gnome-terminal/profiles/$profile/scrollback_unlimited true

gconftool-2 --type string --set /apps/gnome-terminal/profiles/$profile/background_type image

gconftool-2 --type string --set /apps/gnome-terminal/profiles/$profile/font "Ubuntu Mono 11.2998046875"
