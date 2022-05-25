#!/bin/bash
file_exists=false
green="\e[32m"
clear_color="\e[0m"
red="\e[31m"
valid=true

# This code handles to get the flag and its value
while getopts 'f:' flag; do
  case ${flag} in
    f) file=${OPTARG} 
		file_exists=true
		# Checks if the file doesn't exists
		if ! [ -f "$file" ]; then
			echo "${file} doesn't exists."
			exit 1
		fi
	;;
    *) echo "This flag doesn't exist"
       exit 1 ;;
  esac
done

# The file content is passed to the variable pass if there is a flag
# otherwise the first argument will be put in pass
if [[ "$file_exists" = true ]]; then
	pass=$(cat $file)
else
	pass=$1
fi

#calculates the length of the password
length=`echo -n "$pass"|wc -c`


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