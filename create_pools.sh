## Note: The 'while' loops below pause between pools to allow all
##       PGs to be created.  This is a safety mechanism to prevent
##       saturating the Monitor nodes.
## -------------------------------------------------------------------

ceph osd pool create .intent-log 16
ceph osd pool set .intent-log size 3
while [ $(ceph -s | grep creating -c) -gt 0 ]; do echo -n .;sleep 1; done

ceph osd pool create .log 16
ceph osd pool set .log size 3
while [ $(ceph -s | grep creating -c) -gt 0 ]; do echo -n .;sleep 1; done

ceph osd pool create .rgw 16
ceph osd pool set .rgw size 3
while [ $(ceph -s | grep creating -c) -gt 0 ]; do echo -n .;sleep 1; done

ceph osd pool create .rgw.buckets 4096
ceph osd pool set .rgw.buckets size 3
while [ $(ceph -s | grep creating -c) -gt 0 ]; do echo -n .;sleep 1; done

ceph osd pool create .rgw.buckets.extra 32
ceph osd pool set .rgw.buckets.extra size 3
while [ $(ceph -s | grep creating -c) -gt 0 ]; do echo -n .;sleep 1; done

ceph osd pool create .rgw.buckets.index 32
ceph osd pool set .rgw.buckets.index size 3
while [ $(ceph -s | grep creating -c) -gt 0 ]; do echo -n .;sleep 1; done

ceph osd pool create .rgw.control 16
ceph osd pool set .rgw.control size 3
while [ $(ceph -s | grep creating -c) -gt 0 ]; do echo -n .;sleep 1; done

ceph osd pool create .rgw.gc 16
ceph osd pool set .rgw.gc size 3
while [ $(ceph -s | grep creating -c) -gt 0 ]; do echo -n .;sleep 1; done

ceph osd pool create .rgw.root 16
ceph osd pool set .rgw.root size 3
while [ $(ceph -s | grep creating -c) -gt 0 ]; do echo -n .;sleep 1; done

ceph osd pool create .usage 16
ceph osd pool set .usage size 3
while [ $(ceph -s | grep creating -c) -gt 0 ]; do echo -n .;sleep 1; done

ceph osd pool create .users 16
ceph osd pool set .users size 3
while [ $(ceph -s | grep creating -c) -gt 0 ]; do echo -n .;sleep 1; done

ceph osd pool create .users.email 16
ceph osd pool set .users.email size 3
while [ $(ceph -s | grep creating -c) -gt 0 ]; do echo -n .;sleep 1; done

ceph osd pool create .users.swift 16
ceph osd pool set .users.swift size 3
while [ $(ceph -s | grep creating -c) -gt 0 ]; do echo -n .;sleep 1; done

ceph osd pool create .users.uid 16
ceph osd pool set .users.uid size 3
while [ $(ceph -s | grep creating -c) -gt 0 ]; do echo -n .;sleep 1; done

