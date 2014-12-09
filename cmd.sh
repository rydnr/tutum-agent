#!/bin/bash

# make sure cgroup-lite -> cgroup-bin transition takes place
/cgroupfs_mount.sh

/usr/bin/supervisord

# tutum-agent leaves docker daemon alive
# it's important to kill docker before terminating container
# see https://github.com/jpetazzo/dind/issues/19
/sbin/start-stop-daemon --stop --pidfile "/var/run/docker.pid"

exit 0
