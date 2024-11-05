#!/bin/bash

# Run the Perl script and capture its output
output=$(perl my_script.pl)

# Word to search for in the output
search_word="your_word"  # Replace "your_word" with the word you want to check for

# Check if the output contains the word
if echo "$output" | grep -q "$search_word"; then
    echo "The output contains the word: $search_word"
else
    echo "The output does NOT contain the word: $search_word"
fi
