#!/bin/bash

websites=("https://permaditya.my.id" "https://wacanaindonesia.com" "https://sintaksis.agency")

for addr in "${websites[@]}"
do
  response=$(curl -o /dev/null -s -w '%{http_code}\n' "$addr")

  case "$response" in
    200)
      gum spin --spinner dot --title "Please wait..Checking the server ⏳" -- sleep 2
      echo "Website at $addr is up and running 🌐 (HTTP Status Code: $response - OK✅)"
      ;;
    301)
      gum spin --spinner dot --title "Please wait..." -- sleep 2
      echo "Website $addr has permanently moved 󰑄 (HTTP Status Code: $response - Moved Permanently)"
      ;;
    302)
      gum spin --spinner dot --title "Please wait..." -- sleep 2
      echo "Website $addr has temporarily moved 󰑄 (HTTP Status Code: $response - Found)"
      ;;
    404)
      gum spin --spinner dot --title "Please wait..." -- sleep 2
      echo "Website $addr is not found 󰒏 (HTTP Status Code: $response - Not Found)"
      ;;
    500)
      gum spin --spinner dot --title "Please wait..." -- sleep 2
      echo "Website $addr has encountered an internal server error ⛔️ (HTTP Status Code: $response - Internal Server Error ❌)"
      ;;
    *)
      echo "Website $addr returned an unexpected status code 󰐍 (HTTP Status Code: $response)"
      ;;
  esac
done

