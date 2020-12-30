

docker允许你管理docker0桥接或者通过-b选项自定义桥接网卡，需要安装bridge-utils软件包。操作流程如下：

a）确保docker的进程是停止的

b）创建自定义网桥

c）给网桥分配特定的ip

d）以-b的方式指定网桥

具体操作过程如下（比如创建容器的时候，指定ip为192.168.5.1/24网段的）：

```
[root@localhost ~]# service docker stop
[root@localhost ~]# ip link set dev docker0 down
[root@localhost ~]# brctl delbr docker0
[root@localhost ~]# brctl addbr bridge0
[root@localhost ~]# ip addr add 192.168.5.1/24 dev bridge0      //注意，这个192.168.5.1就是所建容器的网关地址。通过docker inspect container_id能查看到
[root@localhost ~]# ip link set dev bridge0 up
[root@localhost ~]# ip addr show bridge0
[root@localhost ~]# vim /etc/sysconfig/docker      //即将虚拟的桥接口由默认的docker0改为bridge0
将
OPTIONS='--selinux-enabled --log-driver=journald'
改为
OPTIONS='--selinux-enabled --log-driver=journald -b=bridge0'    //即添加-b=bridge0
[root@localhost ~]# service docker restart
```
