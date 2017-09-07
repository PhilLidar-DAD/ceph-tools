#!/bin/bash

for i in sd{a..b}; do
    for j in ceph{01..03}; do

        DISK=$j:$i
        echo $DISK
        DELAY=5

        while true; do

            ceph-deploy disk zap $DISK && ceph-deploy \
--overwrite-conf osd prepare $DISK

            if [ $? = 0 ]; then
                break
            fi

            echo "Sleeping for ${DELAY}s..."
            sleep $DELAY

            let DELAY=DELAY*2
        done
    done
done

