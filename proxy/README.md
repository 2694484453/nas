## 项目名称
proxy

## 简介
linux端proxy软件

## 安装
```text
apt-get install proxychains
```

## 配置
```text
vi /etc/proxychains.conf
```

## 验证
输出应显示代理 IP，而非本地 IP。
```text
proxychains curl cip.cc

proxychains -f /etc/proxychains.conf curl cip.cc

proxychains -f /etc/proxychains.conf curl ifconfig.me
```

## 使用
```text

export PROXYCHAINS_CONF_FILE=/etc/proxychains.conf
```
