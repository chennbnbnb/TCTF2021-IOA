FROM ubuntu:20.04
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y libssl-dev openssl iproute2 iptables iputils-ping

#构建www目录
RUN mkdir -p /app/cert /app/www
ADD www/ /app/www/

#拷贝文件
ADD start.sh flag.txt getflag setup.sh sslvpnd user.txt /app/

#运行
RUN /app/setup.sh
CMD ["/app/start.sh"] 