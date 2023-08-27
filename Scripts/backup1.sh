#!/bin/bash
archive="$1"

originalsize=$(file $archive | rev | cut -d' ' -f1 | rev)
step=100
blocks=$(echo "$originalsize / 512 / 20 / $step" | bc)

tar -xvz --checkpoint=$step --totals \
 --checkpoint-action="exec='p=\$(echo "\$TAR_CHECKPOINT/$blocks" | bc -l);printf \"%.4f%%\r\" \$p'" \
 -f $archive
