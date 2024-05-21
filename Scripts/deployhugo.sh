#!/bin/sh
USER='aditya'
HOST='103.174.115.26'
PORT='3323'
DIR=/Publics/wacanaindonesia.com/public_html/   # the directory where your web site files should go

hugo && rsync -avz -e "ssh -p ${PORT}" --delete /home/permaditya/Public/company-profile/rwi/hugo/Rubrik_Wacana_Indonesia/public/ ${USER}@${HOST}:~/${DIR}
 # this will delete everything on the server that's not in the local public folder 

exit 0
