#!/bin/bash
#set -xv

#Question:
# Extend above bash script to rename the all files whose name starts with letter "x" inside your assignment directory and list them on console..
# After renaming the all files store the output of listing of files inside the directory to some assignment.log file with date and time 
# inside the log all re-naming of files happens

# Appends timpestamp to all .txt files starting with 'x' in the current directory, shows it on the console and logs it to Assignment.log
for filename in `find . -maxdepth 1 -type f -name \*.txt | cut --complement -c1,2 | grep ^x`
#'ls *.txt' works too but writes to stderr if no file is found whereas 'find' returns nothing on error
#The cut command cuts the characters at position one and two
do
	newfilename="$(date | tr ' ' '-')-$filename" #prepend timespamp and replace space by dash
	mv "$filename" "$newfilename"
	curr_date_time="$(date)"
	echo "$filename is renamed to $newfilename @ $curr_date_time" | tee -a Assignment.log
	# 'tee' writes to a file and display it on the console as well. -a appends to the file instead of overwriting it
done
