gp-load-monitor
===============

rrd scripts to monitor the load on the gpatlas disks


to run with crontab:
--------------------


`crontab -e` then add

```
*/5 * * * * /home/gerbaudo/load_monitor/update_and_plot.sh
```

copy out to www with `cp_to_lxplus.sh`

