#!/usr/bin/env python3

import curses, time

stdscr = curses.initscr()

curses.flash()

#begin_x = 20; begin_y = 7
#height = 5; width = 40
#win = curses.newwin(height, width, begin_y, begin_x)

pad = curses.newpad(100, 100)
pad.refresh( 0,0, 5,5, 20,75)

time.sleep(2)
curses.endwin()
