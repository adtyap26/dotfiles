#!/usr/bin/env bash

# Directs audio input (e.g. mic) to audio output (e.g. speakers),
# then sleeps forever. Stops audio redirection when it is killed.
# So, for example, plug your phone into the PC's mic, run 'listen',
# and listen to phone audio through your computer's speakers.
#
# Requires:
# sudo apt-get install pactl

set -e

module=$(pactl load-module module-loopback latency_msec=10)

function cleanup {
  pactl unload-module $module
}

trap cleanup EXIT

sleep infinity
