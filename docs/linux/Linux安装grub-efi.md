
* efi分区挂载到/boot/efi目录
* 编辑 ` /etc/fstab ` 文件
* `sudo blkid `查看UUID
* 挂载
```
sudo mount /dev/sdb1 /boot/efi/
sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub

```