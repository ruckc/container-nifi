#!/bin/sh

/opt/nifi/bin/nifi.sh run &
nifi_pid="$!"

tail -F "/opt/nifi/logs/nifi-app.log" &

trap 'echo Received trapped signal, beginning shutdown...;/opt/nifi/bin/nifi.sh stop;exit 0;' TERM HUP INT;
trap ":" EXIT

wait ${nifi_pid}
