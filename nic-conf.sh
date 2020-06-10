cd /root/iproute2/tc
./tc qdisc add dev enp3s0f4 root handle 1: multiq
./tc filter add dev enp3s0f4 parent 1: protocol ip prio 1 u32 match ip dst 102.28.28.158 action skbedit queue_mapping 2
cd /root/Sony/TM-scripts/

To show filters 
---------------
tc -s filter show dev enp3s0f4



For VLAN
--------

tc qdisc add dev enp3s0f4 root handle 1: multiq
tc filter add dev enp3s0f4 parent 1: protocol 802.1q prio 1 u32 match ip dst 102.12.12.85  action skbedit queue_mapping 2
tc filter add dev enp3s0f4 parent 1: protocol 802.1q prio 1 u32 match ip dst 102.11.11.85  action skbedit queue_mapping 1
cxgbtool enp3s0f4 sched-queue 2 2
cxgbtool enp3s0f4 sched-queue 1 1
cxgbtool enp3s0f4  sched-class  params type packet level cl-rl mode class rate-unit bits rate-mode absolute  channel 0 class 2 max-rate 100000 pkt-size 1460
cxgbtool enp3s0f4  sched-class  params type packet level cl-rl mode class rate-unit bits rate-mode absolute  channel 0 class 1 max-rate 100000 pkt-size 1460

iperf -c 102.12.12.85
------------------------------------------------------------
Client connecting to 102.12.12.85, TCP port 5001
TCP window size: 85.0 KByte (default)
------------------------------------------------------------
[  3] local 102.12.12.89 port 59388 connected with 102.12.12.85 port 5001
[ ID] Interval       Transfer     Bandwidth
[  3]  0.0-10.0 sec   115 MBytes  96.1 Mbits/sec

cxgbtool enp3s0f4  sched-class  params type packet level cl-rl mode class rate-unit bits rate-mode absolute  channel 0 class 2 max-rate 600000 pkt-size 1460

iperf -c 102.12.12.85 -P100 > a

cat a | grep SUM
[SUM]  0.0-11.8 sec   820 MBytes   581 Mbits/sec

For IPv6
--------
tc qdisc add dev enp3s0f4 root handle 1: multiq
tc filter add dev enp3s0f4 parent 1: protocol ipv6 prio 1 u32 match ip6 dst 1012::85  action skbedit queue_mapping 2
tc filter add dev enp3s0f4 parent 1: protocol ipv6 prio 1 u32 match ip6 dst 1011::85  action skbedit queue_mapping 1
cxgbtool enp3s0f4 sched-queue 2 2
cxgbtool enp3s0f4 sched-queue 1 1


[root@aqua6 TM_Scripts]# cxgbtool enp3s0f4  sched-class  params type packet level cl-wrr  channel 0 class 1 weight 10
[root@aqua6 TM_Scripts]# cxgbtool enp3s0f4  sched-class  params type packet level cl-wrr  channel 0 class 2 weight 90
[root@aqua6 TM_Scripts]# iperf -V -c 1011::85 -P100 > a & iperf -V -c 1012::85 -P100 > b
[root@aqua6 TM_Scripts]# cat a b | grep SUM
[SUM]  0.0-10.3 sec  1.76 GBytes  1.46 Gbits/sec
[SUM]  0.0-10.3 sec  13.4 GBytes  11.2 Gbits/sec


