#!/bin/sh

dd if=/dev/zero of=/gdata/atlas/gerbaudo/stress.out count=512 bs=1024k
sleep 1
dd if=/gdata/atlas/gerbaudo/stress.out of=/dev/null bs=4096k
sleep 1
rm /gdata/atlas/gerbaudo/stress.out
