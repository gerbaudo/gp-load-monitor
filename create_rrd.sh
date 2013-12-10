#!/bin/sh


# Data Source Fields: DS:DS-Name:DST:HeartBeat:Min:Max
# Round Robin Archives: RRA:CF:XFF:Steps:Rows

RRDTOOL="/usr/bin/rrdtool"
RRDFILE="/home/gerbaudo/load_monitor/time_ls.rrd"

${RRDTOOL} create ${RRDFILE} \
 --start N --step 300 \
 DS:home-ls-time:GAUGE:600:0.0:10.0 \
 DS:gdata-ls-time:GAUGE:600:0.0:10.0 \
 RRA:MIN:0.5:12:1440 \
 RRA:MAX:0.5:12:1440 \
 RRA:AVERAGE:0.5:1:1440

