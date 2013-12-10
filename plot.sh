#!/bin/sh

# 

rrdtool graph \
 /home/gerbaudo/load_monitor/lstime.png -a PNG \
 --title="ls time" \
 'DEF:ls-home=/home/gerbaudo/load_monitor/time_ls.rrd:home-ls-time:AVERAGE' \
 'DEF:ls-gdata=/home/gerbaudo/load_monitor/time_ls.rrd:gdata-ls-time:AVERAGE' \
 'DEF:find-home=/home/gerbaudo/load_monitor/time_find.rrd:home-find-time:AVERAGE' \
 'DEF:find-gdata=/home/gerbaudo/load_monitor/time_find.rrd:gdata-find-time:AVERAGE' \
 'LINE1:ls-home#ff0000:ls /home/user' \
 'LINE1:ls-gdata#0400ff:ls /gdata/atlas \j'\
 'LINE1:find-home#FF9900:/home/user' \
 'LINE1:find-gdata#009900:/gdata/atlas \j'\
 'GPRINT:ls-home:LAST:Last ls /home/user\: %2.2lf s' \
 'GPRINT:ls-gdata:LAST:Last ls /gdata/atlas\: %2.2lf s \j'\
 'GPRINT:find-home:LAST:Last find /home/user\: %2.2lf s' \
 'GPRINT:find-gdata:LAST:Last find /gdata/atlas\: %2.2lf s \j'
