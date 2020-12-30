

```
sudo yum install fcitx fcitx-sunpinyin.x86_64 fcitx-cloudpinyin.x86_64 fcitx-configtool.x86_64 -y


sudo vim /etc/profile

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
```