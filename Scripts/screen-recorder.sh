#!/bin/bash
A="$(pacmd list-sources | grep -PB 1 "analog.*monitor>" | head -n 1 | perl -pe 's/.* //g')"
# F="$(date --iso-8601=minutes | perl -pe 's/[^0-9]+//g').mkv"
# V="$(xdpyinfo | grep dimensions | perl -pe 's/.* ([0-9]+x[0-9]+) .*/$1/g')"

if pidof ffmpeg
  then
    killall ffmpeg

    notify-send -i ~/Apps/Tokyo-Night-GTK-Theme/icons/Tokyonight-Dark/actions/22/kdenlive-hide-video.svg 'Stopped Recording!' 
  else 
    slop=$(slop -f "%x %y %w %h")

    read -r X Y W H < <(echo $slop)

    time=$(date "+%F_%H-%M-%S")


    # only start recording if we give a width (e.g we press escape to get out of slop - don't record)
    width=${#W}

    if [ $width -gt 0 ];
     then
      notify-send -i ~/Apps/Tokyo-Night-GTK-Theme/icons/Tokyonight-Dark/actions/22/kdenlive-show-video.svg 'Started Recording!'       
      # records without audio input
      # for audio add "-f alsa -i pulse" to the line below (at the end before \, without "")

#       ffmpeg -f alsa -ac 2 -i pulse -f x11grab -r 25 -s 1366x768 -i :0.0 \
# -vcodec libx264 -pix_fmt yuv420p -preset ultrafast -crf 0 -threads 0 \
# -acodec pcm_s16le -y output.mkv


#speaker On!
# ffmpeg -f x11grab -s "$W"x"$H" -framerate 30  -thread_queue_size 512  -i $DISPLAY.0+$X,$Y  -f pulse -i "$A" -f pulse -i default -filter_complex amerge -ac 2 \
#        -vcodec libx264 -qp 18 -preset ultrafast \
#        ~/Videos/ScreenRecorder/recording-$time.mp4
#
#
      # -preset veryfast "$F"\
      ffmpeg -f x11grab -s "$W"x"$H" -framerate 30  -thread_queue_size 512  -i $DISPLAY.0+$X,$Y  -f pulse -i "$A" -f pulse -i default \
       -vcodec libx264 -qp 18 -preset ultrafast \
       ~/Videos/ScreenRecorder/recording-$time.mp4

    fi
fi

