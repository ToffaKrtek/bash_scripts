#!/bin/bash
if [ ! -e sysctl.config ];
then
    echo "net.ipv4.tcp_max_syn_backlog = 4096\n
    net.ipv4.tcp_synack_retries = 1\n
    net.ipv4.tcp_fin_timeout = 10\n
    net.ipv4.tcp_keepalive_time = 120\n
    net.ipv4.tcp_keepalive_itvl = 20\n
    net.ipv4.tcp_keepalive_probes = 3\n
    net.ipv4.tcp_syncookies = 1\n
    net.ipv4.ip_local_port_range = 1024 65535\n
    net.ipv4.tcp_tw_reuse = 1\n
    net.ipv4.netfilter.nf_conntrack_max = 1048576\n
    net.ipv4.netdev_max_backlog = 10000\n
    net.ipv4.core.somaxconn = 81920\n
    net.ipv4.tcp_notsent_lowat = 65536\n
    net.ipv4.tsp_slow_start_after_idle = 0\n
    net.ipv4.core.tcp_mtu_probing = 1\n
    net.ipv6.conf.all.disable_ipv6= 1\n
    net.ipv6.conf.default.disable_ipv6= 1\n
    net.ipv6.conf.lo.disable_ipv6= 1\n
    net.ipv4.tsp_congestion_control = brr\n
    net.core.default_qdisc = fq\n
    net.ipv4.tcp_fastopen = 3\n" >> sysctl.config
fi
