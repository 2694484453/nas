> 拷贝service文件到/etc/systemd/system/目录下，
```aiignore
cp *.service /etc/systemd/system
```
> 重新加载 systemd 配置
```aiignore
sudo systemctl daemon-reload
```
> 启用开机自启
```aiignore
sudo systemctl enable name.service
```
> 启动服务
```aiignore
sudo systemctl start name.service
```
>检查服务状态
```aiignore
sudo systemctl status name.service
```
>查看详细日志
```aiignore
sudo journalctl -u name.service -f
```
