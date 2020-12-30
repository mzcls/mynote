

* F31 默认启用了 CgroupsV2，但是当前docker运行时不支持,可以通过添加内核参数禁用,
```
  vim /etc/default/grub 
  GRUB_CMDLINE_LINUX with systemd.unified_cgroup_hierarchy=0
  
  sudo grub2-mkconfig -o  /boot/grub2/grub.cfg

```

* 或者直接安装docker-ce

```
  sudo dnf config-manager --add-repo=https://download.docker.com/linux/fedora/docker-ce.repo
  sudo dnf install docker-ce
  sudo systemctl enable --now docker
 
``` 