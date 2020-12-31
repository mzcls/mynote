
* Ubuntu 自17.10开始,已经放弃`/etc/network/interfaces`里固定ip的配置,即使配置也不会生效,而是改成netplan方式,配置写在`/etc/netplan/50-cloud-init.yaml`中,修改配置以后不需要重启,执行`netplan apply`生效.

```
sudo vim /etc/netplan/50-cloud-init.yaml


# This file is generated from information provided by
# the datasource.  Changes to it will not persist across an instance.
# To disable cloud-init's network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    ethernets:
        eth0:  //网卡名称
            dhcp4: no //dhcp
            addresses: [192.168.110.69/24]  //
            gateway4: 192.168.110.1
            nameservers:
                    addresses: [114.114.114.114,192.168.110.1] //DNS
    version: 2

//保存后执行
sudo netplan apply
######
特别注意yaml文件缩进

```