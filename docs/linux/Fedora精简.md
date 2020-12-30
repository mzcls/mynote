

```
sudo dnf remove baobab  abrt   libreoffice-* rhythmbox gnome-boxes gnome-maps   gnome-weather   cheese gnome-cal* gnome-contacts  yelp   simple-scan evince totem gnome-clocks gnome-characters gnome-font-viewer gnome-disk
```

```
//huawei mirrors

sed -i "s/#baseurl/baseurl/g" /etc/yum.repos.d/fedora.repo /etc/yum.repos.d/fedora-updates.repo /etc/yum.repos.d/fedora-modular.repo /etc/yum.repos.d/fedora-updates-modular.repo

sed -i "s/metalink/#metalink/g" /etc/yum.repos.d/fedora.repo /etc/yum.repos.d/fedora-updates.repo /etc/yum.repos.d/fedora-modular.repo /etc/yum.repos.d/fedora-updates-modular.repo

sed -i "s@http://download.fedoraproject.org/pub/fedora/linux@https://mirrors.huaweicloud.com/fedora@g" /etc/yum.repos.d/fedora.repo /etc/yum.repos.d/fedora-updates.repo /etc/yum.repos.d/fedora-modular.repo /etc/yum.repos.d/fedora-updates-modular.repo

```
