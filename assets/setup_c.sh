#!/bin/bash

if [ ! -f "url.txt" ]; then
  # Define the URL
  url="https://script.google.com/macros/s/AKfycbxW2kPaa9hjfQL7r9zXHAqI9JRfZCB2U4vE2Xqcl_e27k8ZnOjAUojcjHTr45CwqObv/exec"

  # Fetch data from the URL using curl
  result=$(curl -s "$url")

  # Check if the result is not empty
  if [ -n "$result" ]; then
      # Do something with the result, such as printing it
      echo "${url}?c=${result}" > url.txt
  else
      echo "Error: No result obtained from the curl command."
  fi
fi
