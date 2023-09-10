#!/bin/bash

# Check if the ffmpeg command is available
if ! command -v ffmpeg > /dev/null 2>&1; then
  echo "Error: ffmpeg is not installed or not in the PATH"
  exit 1
fi

# Prompt the user for the video file name

echo -e "Enter the name of the video file: " 
video_file=$(gum filter --fuzzy --prompt="Select JSON file: " --prompt.foreground="4" --match.foreground="1")
echo "You have selected: $video_file"

sleep 1 
# Check if the video file exists
if [ ! -f "$video_file" ]; then
  echo "Error: the specified video file does not exist"
  exit 1
fi

gum spin --spinner dot --title "Scan the information..." -- sleep 3

# Set the current date and time
date_str=$(date +%Y-%m-%d_%H-%M-%S)

# Set the output file name
output_file="instagram_story_$date_str.mp4"

# Convert the video using ffmpeg
 # ffmpeg -i "$video_file" -vf scale=720:-1 -c:a copy "$output_file"
# ffmpeg -i "$video_file" -c:a libfdk_aac -b:a 128k -c:v libx264 -b:v 2333k -pix_fmt yuv420p -c:a aac "$output_file"
ffmpeg -i "$video_file" -vf "scale=2*trunc(iw/2):-2,setsar=1" -profile:v main -pix_fmt yuv420p "$output_file"
# ffmpeg -i "$video_file" -vf scale=-2:720 -c:v libx264 -profile:v main -level:v 3.0 -x264-params scenecut=0:open_gop=0:min-keyint=72:keyint=72 -c:a aac -preset slow -crf 23 -r 30 -sn -f mp4 "$output_file" 
# ffmpeg -i "$video_file" -vf scale=-2:720 -c:v libx264 -profile:v main -level:v 3.0 -x264-params scenecut=0:open_gop=0:min-keyint=72:keyint=72:ref=4 -c:a aac -b:v 3500k -maxrate 3500k -bufsize 3500k -r 30 -ar 44100 -b:a 256k -pass 1 -sn -f mp4 NUL && \ 
#  ffmpeg -i "$video_file" -vf scale=-2:720 -c:v libx264 -profile:v main -level:v 3.0 -x264-params scenecut=0:open_gop=0:min-keyint=72:keyint=72:ref=4 -c:a aac -b:v 3500k -maxrate 3500k -bufsize 3500k -r 30 -ar 44100 -b:a 256k -pass 2 "$output_file"
# Print a success message
echo "Successfully converted video and saved to $output_file"

