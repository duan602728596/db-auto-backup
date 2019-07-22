path = require 'path'
mysqldump = require 'mysqldump'
moment = require 'moment'

# 备份数据
backupData = (backUpDir, host, port, user, password, database) ->
  return () ->
    time = moment()

    mysqldump {
      connection: {
        host
        port
        user
        password
        database
      }
      dumpToFile: path.join backUpDir, time.format('YYYY.MM.DD.HH.mm.ss') + '.sql'
    }

    console.log '备份文件：' + time.format('YYYY-MM-DD HH:mm:ss')

module.exports = backupData