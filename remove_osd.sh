#!/bin/bash

function wait_ok() {
    echo -n "Waiting for rebalance to finish..."
    sleep 60
    while true; do
        ceph -s | grep HEALTH_OK >/dev/null
        if [ $? -eq 0 ]; then
            echo
            break
        fi
        echo -n "."
        sleep 60
    done
}

function check_output() {
    return_code=$1
    stdout=$2
    #stderr=$3
    if [ $return_code -ne 0 ]; then
        echo "Error running command!"
        echo "return_code: $return_code"
        echo "stdout: $stdout"
        #echo "stderr: $stderr"
        exit 1
    fi
}

echo "Taking out OSD=$1 from cluster..."
STDOUT=$( ceph osd out osd.$1 )
check_output $? $STDOUT

echo "Stopping OSD=$1 service..."
STDOUT=$( stop ceph-osd id=$1 )
#check_output $? $STDOUT

echo "Removing OSD=$1 from CRUSH map..."
STDOUT=$( ceph osd crush remove osd.$1 )
check_output $? $STDOUT

wait_ok

echo "Deleting authentication key for OSD=$1..."
STDOUT=$( ceph auth del osd.$1 )
check_output $? $STDOUT

echo "Removing OSD=$1..."
STDOUT=$( ceph osd rm $1 )
check_output $? $STDOUT

wait_ok

echo "Done!"



