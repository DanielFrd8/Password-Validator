#!/bin/bash

pass=$1
length=`echo -n "$1"|wc -c`
green="\e[32m"
clear_color="\e[0m"
red="\e[31m"
valid=true


# Checks if the password is less than 10 characters
if [ $length -lt 10 ]; then 
	echo -e "${red}The password should have 10 characters${clear_color}"
	valid=false
fi

# Checks if the password has at least one number
if ! [[ $pass =~ [[:digit:]] ]]; then
	echo -e "${red}The password is missing a number${clear_color}"
	valid=false
fi

# Checks if the password has at least one upper character
if ! [[ $pass =~ [[:upper:]] ]]; then
    echo -e "${red}The password is missing a upper case character${clear_color}"
	valid=false
fi

# Checks if the password has at least one lower character
if ! [[ $pass =~ [[:lower:]] ]]; then
    echo -e "${red}The password is missing a lower case character${clear_color}"
	valid=false
fi

#checks if the password is valid
if [ "$valid" = true ]; then
	echo -e "${green}The password is OK${clear}"
	exit 0
fi

exit 1