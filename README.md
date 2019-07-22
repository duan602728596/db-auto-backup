# db-auto-backup

MySQL或MariaDB数据库的自动备份脚本。

## 代码编译

拉取代码后运行`npm run build`，编译代码到`lib`文件夹。

## 使用方法

1. 新建`dbAutoBackup.json`配置文件。
2. 配置数据库相关信息。

## API

* db `{ object }` : 配置数据库连接相关信息。
  * host `{ string }` : 配置数据库的host。
  * port `{ number }` : 配置数据库的端口号。
  * user `{ string }` : 配置数据库的用户名。
  * password `{ string }` : 配置数据库的密码。
  * database `{ string }` : 配置数据库的库名。
* backUpDir `{ string }` : 配置备份地址。