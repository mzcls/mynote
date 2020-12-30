
* zsh
```
sudo apt install zsh -y
//oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

//解决"zsh: no matches found"
//编辑.zshrc
setopt no_nomatch

* vim配置 vimplus
git clone https://github.com/chxuan/vimplus.git ~/.vimplus
cd ~/.vimplus
./install.sh

//多用户支持
//将vimplus在某个用户下安装好后，若需要在其他用户也能够使用vimplus，则执行

sudo ./install_to_user.sh username1 username2 //替换为真实用户名

```