export http_proxy="http://hcs.gpg123.vip:7890"
export https_proxy="http://hcs.gpg123.vip:7890"

#
# 设置HTTP/HTTPS代理（替换为你的代理地址和端口）
export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"
export ALL_PROXY="socks5://hcs.gpg123.vip:7890"  # 适用于所有协议
export ALL_PROXY="socket://hcs.gpg123.vip:7890"

# 验证代理生效
curl -v www.google.com
env | grep -i proxy  # 查看当前环境变量

# 取消代理
unset http_proxy https_proxy ALL_PROXY