## 项目名称
proxy

## 简介
linux端proxy教程

## 安装

### 方式1: 命令行配置
```text
export http_proxy="http://xxxx:7890/"
export https_proxy="https://xxxx:7890/"
```

### 方式2: service配置
编辑Environment=HTTP_PROXY=http://ip:port，修改为你的服务器地址,然后
```text
cp proxy.service /etc/systemd/system

systemctl daemon-reload

systemctl start proxy.service
```


## 验证服务端
流量是否可用，有正确内容
```text
curl -x http://192.168.3.19:7890 https://www.example.com

curl -x socks5://192.168.3.19:7890 https://www.example.com

...
```

## 验证本地
输出应显示代理 IP，而非本地 IP。
```text
wget http:/example.com
或
curl -I curl http://example.com
```

## 使用
```text

export PROXYCHAINS_CONF_FILE=/etc/proxychains.conf
```



## 取消代理
```text
unset http_proxy
unset https_proxy
```
