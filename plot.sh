#!/bin/sh

# 

rrdtool graph \
 /home/gerbaudo/load_monitor/lstime.png -a PNG \
 --title="ls time" \
 'DEF:home=/home/gerbaudo/load_monitor/time_ls.rrd:home-ls-time:AVERAGE' \
 'DEF:gdata=/home/gerbaudo/load_monitor/time_ls.rrd:gdata-ls-time:AVERAGE' \
 'LINE1:home#ff0000:/home/user' \
 'LINE1:gdata#0400ff:/gdata/atlas \j'\
 'GPRINT:home:LAST:Last ls /home/user\: %2.2lf s' \
 'GPRINT:gdata:LAST:Last ls /gdata/atlas\: %2.2lf s \j'
