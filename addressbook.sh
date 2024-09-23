#!/bin/bash

ADDRESS_BOOK="addressbook.txt"

if [ "$1" == "add" ]; then
    echo -n "Enter the name: "
    read name

    echo -n "Enter the phone number: "
    read phone

    echo -n "Enter the email: "
    read email

    echo "$name, $phone, $email" >> $ADDRESS_BOOK
    echo "User was added successfully!"
elif [ "$1" == "search" ]; then
    echo -n "Enter the name, phone number, or email to search: "
    read search_parameter

    grep -i "$search_parameter" $ADDRESS_BOOK
    if [ $? -ne 0 ]; then
        echo "No user found."
    fi
elif [ "$1" == "remove" ]; then
    echo -n "Enter the name, phone number, or email to remove: "
    read search_query

    sed -i "/$search_query/I d" "$ADDRESS_BOOK"

    echo "User removed successfully!"
else
    echo "Incorrect syntax"
fi