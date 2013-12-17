#!/bin/bash
#Question
#1.Write a bash script to determine the following;
#
#   the hostname of the system you are on?
#   the type and version of the operating system the machine machine is running? (Show both at the same time, with one command.)
#   the full path to your home directory?
#   which other users are logged into the machine you are using?
#   what groups you belong to?
#   what files (excluding directories) are located in your home directory and all its subdirectories?
#  All output should be stored in assignment.log file with date and time.


# Display information about the system
text="Hostname: $(hostname)\n"
text="${text}-----------------------------------------------------------\n"
text="${text}Information about the Operating System:\n$(cat /etc/lsb-release)\n"
text="${text}-----------------------------------------------------------\n"
text="${text}Path to home directory: $HOME\n"
text="${text}-----------------------------------------------------------\n"
text="${text}Following users are logged in to the system:\n$(who | cut -d' ' -f1 | uniq) \n"
# Cut first column from the 'who' command and then select only the unique entries
text="${text}-----------------------------------------------------------\n"
text="${text}Current user belongs to the following groups:\n$(groups)\n"
# 'groups' without arguments shows the groups the current user is in
text="${text}-----------------------------------------------------------\n"
text="${text}All files below current directory:\n$(ls -aR ~ 2>&1 | grep -v :$ | grep -v ^\.$ | grep -v ^\.\.$ | tr -s '\n')\n"
# list all files recursively(redirect stderr to stdout), ignore lines ending with ':' and files '.' and '..', then squeeze new lines.
# Actually just one grep instead of three can suffice using the '|' operator in the regular expression like in other languages
# but in the shell it is being treated as the pipe operator. I could not find a way to escape it.
text="${text}-----------------------------------------------------------\n"
text="${text}File Creation: $(date)\n"
echo -e "$text" > "assignment-$(date).log"
