
```
//Dockerfile

FROM ubuntu:18.04
WORKDIR /home/bd
copy baidunetdisk_linux_3.0.1.2.deb .
RUN sed -i "s@http://.*archive.ubuntu.com@http://repo.huaweicloud.com@g" /etc/apt/sources.list \
    && sed -i "s@http://.*security.ubuntu.com@http://repo.huaweicloud.com@g" /etc/apt/sources.list
RUN apt update \
    && apt install desktop-file-utils libnss3  libxss1 libgtk-3-0  libasound2 libx11-xcb1 ttf-ubuntu-font-family ttf-wqy-zenhei -y \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    && ldconfig \
    && dpkg -i baidunetdisk_linux_3.0.1.2.deb \
    && rm baidunetdisk_linux_3.0.1.2.deb 
ENV USER="mz"
RUN useradd -m $USER
USER $USER
## /opt/baidunetdisk  /root/baidunetdisk/
CMD /opt/baidunetdisk/baidunetdisk

```

. 运行

``` 
docker run -it -d -e DISPLAY=$DISPLAY -e USER=$USER -v $HOME:/home/$USER -v /tmp/.X11-unix:/tmp/.X11-unix baidu

```
. 变量
```
DISPLAY: 当前显示器, 可以通过echo $DISPLAY查看
USER: 制定运行百度网盘的用户
