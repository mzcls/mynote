
1. 安装ruby模块
`sudo dnf  -y install ruby rubygems ruby-devel rpm-build`
2. 添加国内的Rubygems仓库
`gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/`
3. 安在fpm
`gem install fpm`

## fpm常用参数
| 参数    | 名称    |
| --- | --- |
| -s |指定源类型|
|   -t |指定目标类型    |
|  -n |指定包的名字   |
|  -v |指定包的版本号  |
|  C |指定打包的相对路径 change directory to here before searching for files |
|  -d |指定依赖于哪些包|
|   -f |第二次打包时目录下如果有同名安装包存在，则覆盖它   |
|   -p |输出的安装包的目录，不想放在当前目录下就需要指定    |
|   –post-install |软件包安装完成之后所要运行的脚本，同–after-install    |
|   –pre-install |软件包安装完成之前所要运行的脚本，同–before-install   |
|    –post-uninstall   |软件包卸载之后所要运行的脚本，同–after-install   |
|    –pre-uninstall |软件包卸载之前所要运行的脚本，同–before-install    |

## 实例
1. 创建工作目录
`mkdir $HOME/data`
2. 创建源文件目录
`mkdir opt usr/local/bin/ usr/lib/systemd/system`

3. 安装后需要执行的脚本ssr_install_post.sh
```o
#!/bin/bash

chmod +x /usr/local/bin/ssr
systemctl daemon-reload
systemctl enable ssr
systemctl start ssr
echo "ssr start success"
```
4. 卸载后需要执行的脚本 after_remove.sh
```
#!/bin/bash

systemctl disable ssr
systemctl stop ssr
rm -rf /usr/local/bin/ssr
rm -rf /usr/lib/systemd/system/ssr.service
echo "Uninstall ssr success"
```
5. 其他脚本
6.打包rpm
```
fpm -f -s dir -t rpm -n shadowsocksr -v 1.0.0 --description ssr-python --post-install ssr_install_post.sh --post-uninstall  after_remove.sh -C /home/mz/rpmbuild/rpm
```
### 参数说明
|     参数      |                                                                                     说明                                                                                     |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| -s dir        | 指定源文件是目录的形式                                                                                                                                                       |
| -t rpm        | 指定打包的格式                                                                                                                                                               |
| -n            | 指定打包后名称                                                                                                                                                               |
| -v            | 版本号                                                                                                                                                                       |
| description   | 描述信息                                                                                                                                                                     |
| -d            | 定需要依赖的包。安装MySQL前需要在系统上安装libaio、libaio-devel。当你安装fpm打包成的rpm包时，它会先去检测系统上是否安装了这两个包，如果没有安装会给出提示，并终止rpm的安装。 |
| –pre-install  | 安装rpm包前需要执行的脚本                                                                                                                                                    |
| –post-install | 安装rpm包后需要执行的脚本                                                                                                                                                    |







