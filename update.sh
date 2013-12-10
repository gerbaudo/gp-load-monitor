#!/bin/sh


#The rrdb was created with the command below:

# rrdtool create lstime.rrd \
# --start N \
# --step 300 \
# DS:home:GAUGE:600:0.0:60.0 \
# DS:gdata:GAUGE:600:0.0:60.0 \
# RRA:AVERAGE:0.5:1:1440 \
# RRA:MIN:0.5:12:1440 \
# RRA:MAX:0.5:12:1440

RRDTOOL="/usr/bin/rrdtool"

RRDFILE="/home/gerbaudo/load_monitor/time_ls.rrd"
lshome=`/usr/bin/time -f "%e" ls -ltrh  /home/gerbaudo > /dev/null`
lsgdata=`/usr/bin/time -f "%e" ls -ltrh  /gdata/atlas > /dev/null`
$RRDTOOL update $RRDFILE N:${lshome}:${lsgdata};

RRDFILE="/home/gerbaudo/load_monitor/time_find.rrd"
findhome=`/usr/bin/time -f "%e" find  /home/gerbaudo/susynt-prod-log -name foo -type f > /dev/null`
findgdata=`/usr/bin/time -f "%e" find /gdata/atlas/ucintprod/SusyNt/susy -name foo -type f> /dev/null`
$RRDTOOL update $RRDFILE N:${findhome}:${findgdata};

# debugging
# if [ $? = '0' ]; then
#     echo "update done\n";
# else
#     echo "update failed\n";
# fi
