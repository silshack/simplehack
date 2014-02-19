#!/bin/bash

heroku run printenv | awk '/HEROKU_POST/ {print "export "$1}'>>~/.bashrc 
source ~/.bashrc
printenv | awk '/HEROKU_POST/'| awk -F'[=]' '{print "DATABASE_URI = \x27"$1"\x27"}'>db.py
