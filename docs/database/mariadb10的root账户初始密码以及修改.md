
```
//免密登陆
sudo mysql -uroot -p //直接回车登录

use mysql;

update user set authentication_string=password('root'),plugin='mysql_native_password' where user='root';

flush privileges;

```
