path = require 'path'
glob = require 'glob'
moment = require 'moment'
fse = require 'fs-extra'
_ = require 'lodash'

# 获取文件
getFiles = (dir) ->
  return new Promise (resolve, reject) ->
    file = path.join dir, '**/*.sql'

    glob file, (err, files) ->
      if err
        reject err
      else
        resolve files

# 删除文件
deleteFiles = (file) ->
  return new Promise (resolve, reject) ->
    fse.remove file, (err) ->
      if err
        reject err
      else
        resolve()

# 格式化成时间
formatData = (name) ->
  nameArr = name.split('.')
  chunks = _.chunk nameArr, 3

  return chunks[0].join('-') + ' ' + chunks[1].join(':')

# 删除5天前的数据
deleteFile = (dir) ->
  return () ->
    files = await getFiles dir
    queue = []

    for file in files
      # 计算时差
      fileInfo = path.parse file
      time = formatData(fileInfo.name)

      cha = moment().from(time)

      # 保留5天
      # test: in a minute
      # production: in 6 days
      if cha == 'in 6 days'
        queue.push deleteFiles file
        console.log '删除文件：' + file

    await Promise.all queue

module.exports = deleteFile