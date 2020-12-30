

创建一个example.desktop

```
[Desktop Entry]
Encoding=UTF-8
Name=IntelliJ IDEA
GenericName=IntelliJ IDEA
Comment=The Java IDE for Professional Developers by JetBrains
Exec=/opt/SoftWare/idea-IU-172.4343.14/bin/idea.sh %f
Icon=/opt/SoftWare/idea-IU-172.4343.14/bin/idea.png
Terminal=false
Type=Application
Categories=Application;Programme;
```

关键词	                     意义
[Desktop Entry]	            文件头
Encoding	                    编码
Name	                    应用名称
Name[xx]	                    不同语言的应用名称
GenericName	            描述
Comment	                注释
Exec	                        执行的命令
Icon	                        图标路径
Terminal	                是否使用终端
Type	                        启动器类型
Categories	            应用的类型（内容相关）


---
创建文件，以.desktop为后缀。
编写内容，修改权限
双击启动程序，添加信任
移动到/usr/share/applications/目录下，这样就可以在左上角应用程序中显示
