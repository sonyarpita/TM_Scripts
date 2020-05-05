cd /root/iproute2/tc
./tc qdisc add dev enp3s0f4 root handle 1: multiq
./tc filter add dev enp3s0f4 parent 1: protocol ip prio 1 u32 match ip dst 102.28.28.158 action skbedit queue_mapping 2
cd /root/Sony/TM-scripts/
