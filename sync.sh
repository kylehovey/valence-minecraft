#!/bin/bash

cd ~/backups/
rsync --bwlimit=200 -v -P -e ssh `ls -t | tail -n 1` backup:~/friendcraft/
