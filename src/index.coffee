schedule = require 'node-schedule'
moment = require 'moment'
backupData = require './backupData'
deleteFile = require './deleteFile'
config = require '../dbAutoBackup.json'

# 获取配置
{ db, backUpDir } = config

# 定时执行备份任务
schedule.scheduleJob config.backupDataTimer || '0 0 8 * * *', backupData(backUpDir, db.host, db.port, db.user, db.password, db.database)

# 定时执行删除任务
schedule.scheduleJob config.deleteFileTimer || '0 0 20 * * *', deleteFile(backUpDir)