## 项目名称
简介：clash for docker，linux端科学上网神器

## 项目部署
> 1.克隆项目
```text
cd /home && git clone https://github.com/2694484453/nas.git
```

> 2.调整你的配置文件

选择你的配置文件，挂载到/root/.config/clash/config.yaml

> 3.部署
```text
docker-compose -f clash-premium.yml up -d --force-recreate
```
> 4.访问

打开http://ip:9091