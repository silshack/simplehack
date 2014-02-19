#!/bin/bash 

printenv | awk '/HEROKU_POST/ {print $1}'| awk -F'[=]' '{print "DATABASE_URI = \x27"$1"\x27"}' > db.py
