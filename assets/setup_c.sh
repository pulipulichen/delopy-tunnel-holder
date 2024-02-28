#!/bin/bash

if [ ! -f "url.txt" ]; then
  # Define the URL
  url="https://script.google.com/macros/s/AKfycbwkzpXsS04JJCbnh3EEtEcIKT1qczBnmvEQTfIFvRjFnoNoAJKGZ_zru308HKBRqr72/exec"

  # Fetch data from the URL using curl
  result=$(curl -sL "$url")

  # Check if the result is not empty
  if [ -n "$result" ]; then
      # Do something with the result, such as printing it
      echo "${url}?c=${result}" > url.txt
  else
      echo "Error: No result obtained from the curl command."
  fi
fi
