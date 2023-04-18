#!/bin/bash 
#some styling used in the script
WARNING='\033[0;31m'
SUCCESS='\033[32m'
CLEAR='\033[0m'

FILE=~/documents/rockyou_2.txt   #create a variable called  FILE which contains know exploitable passwords. File name is called rockyou
echo $'\n' "Type in a password...." $'\n' # prompt user to create a passoword
read inputpassword  #create input for the user 

#-w flag seaches for sequences of letters in the text file
grep -w $inputpassword "$FILE" && echo $WARNING"\n- '$inputpassword' is an exploitable password."$CLEAR || echo $SUCCESS"\n+ '$+ '$inputpassword' doesnt look like a known exploitable password."$CLEAR

if [ ${#inputpassword} -ge 8 ] #check if passord is length is longer than 8
then
 echo $SUCCESS"+ Password length looks good."$CLEAR
else
 echo $WARNING"- Write a longer password.Password should be 8 characters or longer."$CLEAR
fi

numberOnly=`echo "$inputpassword" | grep -E ^\-?[0-9]*\.?[0-9]+$`
if [ "$numberOnly" != '' ]
then 
    echo $WARNING"-Do not use only numbers in your password, try using letters as well."$CLEAR
fi

specialChars=`echo "$inputpassword" | grep '[[:punct:]]'`
if [ "$specialChars" != '' ]
then 
 echo $SUCCESS "+ Detected a special character. "$CLEAR
else
 echo $WARNING "It is strongly advised that you include special characters in your password. Please use special characters in your password"$CLEAR
fi 

