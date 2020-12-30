
假设ssr代理监听**127.0.0.1:1080**

ubuntu安装privoxy

	sudo apt install privoxy -y

编辑配置文件

	sudo vi /etc/privoxy/config

先搜索关键字 **listen-address**找到**listen-address 127.0.0.1:8118**这一句，保证这一句没有注释，8118就是将来http代理要输入的端口。

然后搜索 **forward-socks5t**, 将**#forward-socks5t / 127.0.0.1:1080 . **此句前面的注释去掉, 意思是转发流量到本地的**1080**端口, 而1080端口正是 ssr 监听的端口

启动停止

```
sudo systemctl start/stop privoxy 
```

写入配置文件
```
	vim ~/.profile
	export http_proxy=http://127.0.0.1:8118
	export https_proxy=http://127.0.0.1:8118
```