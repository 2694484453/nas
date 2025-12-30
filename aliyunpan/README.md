```text
sh-3.2# aliyunpan sync -h
NAME:
   aliyunpan sync - 
    备份功能。支持备份本地文件到云盘，备份云盘文件到本地两种模式。支持JavaScript插件对备份文件进行过滤。
    指定本地目录和对应的一个网盘目录，以备份文件。网盘目录必须和本地目录独占使用，不要用作其他用途，不然备份可能会有问题。

  备份功能支持以下模式：
  1. upload 
       备份本地文件，即上传本地文件到网盘，始终保持本地文件有一个完整的备份在网盘
  2. download 
       备份云盘文件，即下载网盘文件到本地，始终保持网盘的文件有一个完整的备份在本地

  请输入以下命令查看如何配置和启动：
    aliyunpan sync start -h


USAGE:
   aliyunpan sync command [command options] [arguments...]

COMMANDS:
   start  启动sync同步备份任务

OPTIONS:
   --help, -h  show help
   
sh-3.2# aliyunpan sync start -h
NAME:
   aliyunpan sync start - 启动sync同步备份任务

USAGE:
   aliyunpan sync start [arguments...]

DESCRIPTION:
   
备份本地文件到文件网盘，或者备份文件网盘的文件到本地。支持命令行配置启动或者使用备份配置文件启动同步备份任务。
   
配置文件保存在：(配置目录)/sync_drive/sync_drive_config.json，样例如下：
{
 "configVer": "1.0",
 "syncTaskList": [
  {
   "name": "设计文档备份",
   "localFolderPath": "D:/tickstep/Documents/设计文档",
   "panFolderPath": "/sync_drive/我的文档",
   "mode": "upload",
   "policy"： "increment"，
   "driveName": "backup"
  }
 ]
}
相关字段说明如下：
name - 任务名称
localFolderPath - 本地目录
panFolderPath - 网盘目录
mode - 备份模式，支持两种: upload(备份本地文件到云盘),download(备份云盘文件到本地)
policy - 备份策略, 支持两种: exclusive(排他备份文件，目标目录多余的文件会被删除),increment(增量备份文件，目标目录多余的文件不会被删除)
driveName - 网盘名称，backup(备份盘)，resource(资源盘)
    
  例子:
  1. 查看帮助
  aliyunpan sync start -h
    
  2. 使用命令行配置启动同步备份服务，将本地目录 D:\tickstep\Documents\设计文档 中的文件备份上传到"备份盘"的云盘目录 /sync_drive/我的文档
  aliyunpan sync start -ldir "D:\tickstep\Documents\设计文档" -pdir "/sync_drive/我的文档" -mode "upload" -drive "backup"

  3. 使用命令行配置启动同步备份服务，将云盘目录 /sync_drive/我的文档 中的文件备份下载到本地目录 D:\tickstep\Documents\设计文档
  aliyunpan sync start -ldir "D:\tickstep\Documents\设计文档" -pdir "/sync_drive/我的文档" -mode "download"

  4. 使用命令行配置启动同步备份服务，将本地目录 D:\tickstep\Documents\设计文档 中的文件备份到云盘目录 /sync_drive/我的文档
       同时配置下载并发为2，上传并发为1，下载分片大小为256KB，上传分片大小为1MB
  aliyunpan sync start -ldir "D:\tickstep\Documents\设计文档" -pdir "/sync_drive/我的文档" -mode "upload" -dp 2 -up 1 -dbs 256 -ubs 1024
    
  5. 使用配置文件启动同步备份服务，使用配置文件可以支持同时启动多个备份任务。配置文件必须存在，否则启动失败。
  aliyunpan sync start

  6. 使用配置文件启动同步备份服务，并配置下载并发为2，上传并发为1，下载分片大小为256KB，上传分片大小为1MB
  aliyunpan sync start -dp 2 -up 1 -dbs 256 -ubs 1024



OPTIONS:
   --drive value   drive name, 网盘名称，backup(备份盘)，resource(资源盘) (default: "backup")
   --ldir value    local dir, 本地文件夹完整路径
   --pdir value    pan dir, 云盘文件夹完整路径
   --mode value    备份模式, 支持两种: upload(备份本地文件到云盘),download(备份云盘文件到本地) (default: "upload")
   --policy value  备份策略, 支持两种: exclusive(排他备份文件，目标目录多余的文件会被删除),increment(增量备份文件，目标目录多余的文件不会被删除) (default: "increment")
   --cycle value   备份周期, 支持两种: infinity(永久循环备份),onetime(只运行一次备份) (default: "infinity")
   --dp value      download parallel, 下载并发数量，即可以同时并发下载多少个文件。0代表跟从配置文件设置（取值范围:1 ~ 10） (default: 0)
   --up value      upload parallel, 上传并发数量，即可以同时并发上传多少个文件。0代表跟从配置文件设置（取值范围:1 ~ 10） (default: 0)
   --dbs value     download block size，下载分片大小，单位KB。推荐值：1024 ~ 10240 (default: 1024)
   --ubs value     upload block size，上传分片大小，单位KB。推荐值：1024 ~ 10240。当上传极大单文件时候请适当调高该值 (default: 10240)
   --log value     是否显示文件备份过程日志，true-显示，false-不显示 (default: "false")
   --ldt value     local delay time，本地文件修改检测延迟间隔，单位秒。如果本地文件会被频繁修改，例如录制视频文件，配置好该时间可以避免上传未录制好的文件。 (default: 3)
   --sit value     scan interval time，扫描文件间隔时间，单位：分钟。 (default: 1)
```