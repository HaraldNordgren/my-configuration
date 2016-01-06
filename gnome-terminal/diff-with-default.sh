#!/bin/bash

colordiff <(gconftool-2 --recursive-list /apps/gnome-terminal/profiles/Profile0) <(gconftool-2 --recursive-list /apps/gnome-terminal/profiles/Default)
