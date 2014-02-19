#!/bin/bash

heroku run printenv | awk '/HEROKU_POST/ {print "export "$1}' >> ~/.bashrc
