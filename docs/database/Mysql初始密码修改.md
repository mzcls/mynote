
mysql 5.7 开始 root的plugin被修改成了auth_socket，用密码登陆的plugin应该是mysql_native_password。
```
sudo mysql -uroot -p \\回车，密码为空
select user, plugin from mysql.user;

mysql> update mysql.user set authentication_string=PASSWORD('newPwd'), plugin='mysql_native_password' where user='root';

flush privileges;
```