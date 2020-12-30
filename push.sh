#!/bin/bash
dd=$(date  "+%Y-%m-%d %H:%M:%S")
git add -A
git commit -a -m "$dd"
git push >> /dev/null
