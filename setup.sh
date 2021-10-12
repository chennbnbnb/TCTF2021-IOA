#! /bin/sh
cd `dirname $0`

#构建密钥
mkdir -p cert

#请求输出一个X509格式的证书, 有效期为365天, 生成一个4096长度的RSA私钥文件，用于签发
openssl req -x509 -nodes -newkey rsa:4096 -keyout cert/cert.pem -out cert/cert.pem -days 365 -subj "/CN=SSLVPN"
chmod 644 cert/cert.pem

#输出证书的私钥文件, 长度为4096
openssl genrsa -out cert/ca.key 4096

#请求输出一个X509格式的证书, 有效期为365天, 用于签名待生成的请求证书的私钥文件为cert/ca.key
openssl req -x509 -new -nodes -key cert/ca.key -sha256 -days 365 -out cert/ca.crt -subj "/CN=SSLVPN_CA"

#flag.txt只有root能读
chown 20000:20000 flag.txt
chmod 400 flag.txt

#给getflag +s权限, 所以只能运行getflag获取flag
chown 20000:20000 getflag
chmod 555 getflag
chmod +s getflag



