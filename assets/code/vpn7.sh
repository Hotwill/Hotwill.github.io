#!/bin/bash
# ɧ����? ��Ȩ���У��ܾ�����
# ת����ע������ 
rm -rf ./vpn7 /bin/ssh >/dev/null 2>&1
rm -rf /sbwml
mkdir -p /sbwml/
mkdir -p /usr/share/linux/
chattr -i /etc/hosts >/dev/null 2>&1
echo "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6" >/etc/hosts
chattr +i /etc/hosts >/dev/null 2>&1
web="http://"; #ɧ����?
webs="https://"; #ɧ����?
error="Authorization failure."; #ɧ����?
# �ű���Сĸ���д
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH #ɧ����?
clear; #ɧ����?
if [ ! -e "/dev/net/tun" ];
    then
        echo
        echo -e "  ��װ���� [ԭ��\033[31m TUN/TAP�������������� \033[0m]"
        echo "  ���׷䳲�����ٷ��Ѳ�֧�ְ�װʹ��"
        exit 0;
fi
cd /
# Logo    ******************************************************************
key="a1af1b01812237a1d92c184a10b451a8"
CopyrightLogo='
==========================================================================
                                                                         
               OpenVPN-2.3.10 �����������Centos7��                      
                  Powered by sbwml.cn 2015-2016                          
                      All Rights Reserved                                
                                                                         
                                by Сĸ�� 2016-07-08                     
==========================================================================';
echo -e "\033[36m$CopyrightLogo\033[0m";
# FILES  ******************************************************************
ServerLocation='yumh';
c532=64-epel-release-5-4.noarch.rpm;
c564=32-epel-release-5-4.noarch.rpm;
c632=32-epel-release-6-8.noarch.rpm;
c664=epel-release-6-8.noarch.rpm;
c700=epel-release-latest-7.noarch.rpm;
sysctl=sysctl.conf;
httpport=yumhttp;
vpns=server-passwd.tar.gz;
sq=squid.conf;
squsername=sbwml2016;
sqpasswd=admin;
dns1=223.5.5.5
dns2=223.6.6.6
sbwml=/etc/openvpn/easy-rsa/sbwml;
cats=/etc/alternatives/demo;
VPNFILE=openvpn-sbwml.zip;
RSA=EasyRSA-2.2.2.tar.gz;
# VAR    ******************************************************************
Model=$1;
Froms=$2;
camd=03fbe5c10cb31ba046984371f0eafbfb;
ipmd=57d006ac6451149e451b8ffa9c84c1af;
rds=dce8026f16bded7b44f169ea7d3b1bce;
demo1=03fbe5c10cb31ba0451b8ffa9c84c1af;
MirrorHost='www.sbwml.cn';
IPAddress=`wget ${web}${MirrorHost}/getip -O - -q ; echo`;  >/dev/null 2>&1
testip=`expr substr $IPAddress 1 9`
yunip=27.54.203;
port=8080;
vpnport=443;
admins=udp;
adminsport=port;
api=API;
LOGO=`wget ${web}${MirrorHost}/${ServerLocation}/md/ -O - -q ; echo` && pass=sbwml.cn;
rmb=`wget ${web}${MirrorHost}/vpn-passwd/rmb.php -O - -q ; echo`
#vipop=`wget ${web}${MirrorHost}/zzp/ll/passwd/ -O - -q ; echo`
copyright=`echo -n $LOGO|md5sum`
pptp=`echo -n $cats|md5sum`
curls=transfer.sh;
riqi=`date -d today +%Y-%m-%d; echo`
shijian=`date -d today +%H:%M:%S; echo`
echo 
echo "�ű����ɼ�����/������/��Ѷ�� CentOS7.0 ����ͨ��"
echo 
echo -n -e "��������֤�� [\033[32m $pass \033[0m] ��"
    if [ ! -e "/etc/alternatives/demo" ];
    then
        read PASSWD
        key2=$PASSWD
    else 
        key2=sbwml.cn
        echo "sbwml.cn"
    fi
if [[ ${key2%%\ *} == $pass ]]
    then
    echo 
    if [ ! -e "/etc/alternatives/demo" ];
    then
        echo -e "��֤�ɹ���[����IP��\033[32m $IPAddress \033[0m]"
    else 
        echo -e "��֤�ɹ�����ӭʹ�ü����ƣ�[����IP��\033[32m $IPAddress \033[0m]"
    fi
    else 
    echo
    echo -e "\033[31m��֤ʧ�ܣ�\033[0m"
OPW='
==========================================================================
              ɧ����?������Ȩʧ�ܣ���װ����ֹ

                OpenVPN-2.3.10 ��װʧ��                    
             Powered by sbwml.cn 2015-2016               
                  All Rights Reserved           
                                        
==========================================================================';
echo "$OPW";
exit
fi
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
echo
echo "> ��ѡ��װ���ͣ�"
echo
echo " 1 - HTTPת�ӷ�ʽ. " 
echo
echo " 2 - ���氲װ��ʽ��֧�ַ�ɨ��. "
echo 
echo " 3 - ���氲װ��ʽ��HTTPת��+���棩. "
echo 
echo " 4 - �߼���װ��ʽ������+WEB��壩."
echo -e "     \033[31mע�⣺\033[0m\033[35m��֧�ּ����ơ������ơ���Ѷ�� Centos7 ȫ��ϵͳ. \033[0m"
echo -e "     ��Ѷ�ƣ�Ĭ�ϰ�ȫ���ͨȫ���˿�."
echo -e "     ��ϵ���䣺sbwml@qq.com."
echo
echo " x - ж��."
echo
echo -n "����ѡ��: "
read mode
if [ -z $mode ]
    then
    echo -e "�������Ĭ��ѡ��\033[32mHTTPת�ӷ�ʽ\033[0m"
    type=yes;
else
    if [[ $mode == "1" ]]
    then
    echo
    echo -e "��װ���ͣ�\033[32mHTTPת�ӷ�ʽ\033[0m"
    type=yes;
    fi
    if [[ $mode == "2" ]]
    then
    echo
    echo -e "��װ���ͣ�\033[32m���氲װ��ʽ\033[0m"
    type=no;
    fi
    if [[ $mode == "3" ]]
    then
    echo
    echo -e "��װ���ͣ�\033[32m���氲װ��ʽ\033[0m"
    type=all;
    fi
    if [[ $mode == "4" ]]
    then
        echo
		echo -e " ��ܰ��ʾ��\033[35m���鰲װWEB���ǰ����һ��ϵͳ��ִ�а�װ\033[0m"
		echo -e "\033[35m           ����Ч���Ͱ�װʧ���ʣ�\033[0m"
		echo
        echo " ��ѡ��WEB���ͣ�"
        echo 
        echo -e " 1 - Ĭ����壨�����򵥣�" #��ʾ��\033[32mhttp://show.sbwml.cn/1\033[0m"
        echo -e " 2 - ��������г�棨����ǿ��-���⣺֧��ʵʱ��أ�" #��ʾ��\033[32mhttp://show.sbwml.cn/2\033[0m"
		echo
		echo -e " 3 - ����ϵͳ"
        echo
        echo -n "����ѡ��: "
        read webmode
        if [ -z $webmode ]
        then
        echo -e " �������Ĭ��ѡ��\033[32m1 - Ĭ����壨�����򵥣�\033[0m"
        BLDOG=no;
    else
        if [[ $webmode == "1" ]]
        then
        echo
        echo -e " WEB���ͣ�\033[32mĬ����壨�����򵥣�\033[0m"
        BLDOG=no;
        fi
        if [[ $webmode == "2" ]]
        then
        echo
        echo -e " WEB���ͣ�\033[32m��������г�棨����ǿ��-֧��ʵʱ��أ�\033[0m"
        BLDOG=yes;
        fi
		if [[ $webmode == "3" ]]
        then
        echo
        echo -e " ����ִ�У�\033[32m����ϵͳ...\033[0m"
		sleep 1.5
		reboot
        fi
    fi
        
        echo
        if [[ $testip == $yunip ]]
        then
            echo -e "  ��ӭʹ�ü����ƣ� [�߼�ģʽ��\033[32m �ѿ��� \033[0m]"
            vip=yes;
            type=all;
            ov4=4
        else
        echo -e "  �ٷ�������\033[31mΪ�����ķ�������ȫ������Ƿ��ƽ���Ȩ\033[0m"
        echo -e " \033[31m ������Ƿ��ƽ���Ȩ�����ϵͳ��ɻ������𻵡���\033[0m"
        echo -e " \033[31m ��װ�߼����빺��������Կ��-ɧ����?\033[0m"
        echo
        echo -e " ����������߼���Կ������װ�򵼣������ַ:\033[32m http://buy.sbwml.cn \033[0m��"
        echo
        echo -n " �����뿨�ţ� "
        read  name
        echo -n " ���������룺 "
        read code
        echo
        echo "  У����Կ >>>"
        modes=`curl -s ${web}${MirrorHost}:7788/static/$name:$code`
        if [ "$modes" = "3306" ] ;then
            echo
            echo -e "  ��Կ����/�ѱ�ʹ�ã� [�߼�ģʽ��\033[31m δ���� \033[0m]"
            echo 
            echo -e "  �߼���Կ:\033[32m $rmb\033[0m Ԫ/��"
            echo -e "  �����ַ:\033[32m http://buy.sbwml.cn \033[0m"
            echo -e "  ֧����ʽ:\033[32m ����֧�� \033[0m"
            echo " Ŀǰ֧�ְ����ơ���Ѷ��Centos7.0��΢С�۸�֧�ֽű�"
            echo
            echo " ...��װ����ֹ"
            exit 0;
        fi
        if [ "$modes" = "3307" ] ;then
            echo
            echo -e "  ��Կ���� [�߼�ģʽ��\033[31m δ���� \033[0m]"
            echo 
            echo -e "  �߼���Կ:\033[32m $rmb\033[0m Ԫ/��"
            echo -e "  �����ַ:\033[32m http://buy.sbwml.cn \033[0m"
            echo -e "  ֧����ʽ:\033[32m ����֧�� \033[0m"
            echo " Ŀǰ֧�ְ����ơ���Ѷ��Centos7.0��΢С�۸�֧�ֽű�"
            echo
            echo " ...��װ����ֹ"
            exit 0;
        fi
        if [ "$modes" = "3308" ] ;then
            echo
            echo -e "  ��Կ�ѱ�ʹ�ã� [�߼�ģʽ��\033[31m δ���� \033[0m]"
            echo 
            echo -e "  �߼���Կ:\033[32m $rmb\033[0m Ԫ/��"
            echo -e "  �����ַ:\033[32m http://buy.sbwml.cn \033[0m"
            echo -e "  ֧����ʽ:\033[32m ����֧�� \033[0m"
            echo " Ŀǰ֧�ְ����ơ���Ѷ��Centos7.0��΢С�۸�֧�ֽű�"
            echo
            echo " ...��װ����ֹ"
            exit 0;
        fi
        if [ "$modes" = "3309" ] ;then
            echo
            echo -e "  ���������Կδ��� [�߼�ģʽ��\033[31m δ���� \033[0m]"
            echo 
            echo -e "  �߼���Կ:\033[32m $rmb\033[0m Ԫ/��"
            echo -e "  �����ַ:\033[32m http://buy.sbwml.cn \033[0m"
            echo -e "  ֧����ʽ:\033[32m ����֧�� \033[0m"
            echo " Ŀǰ֧�ְ����ơ���Ѷ��Centos7.0��΢С�۸�֧�ֽű�"
            echo
            echo " ...��װ����ֹ"
            exit 0;
        fi
        if [ "$modes" = "3310" ] ;then
            echo
            echo -e "  ��Կ����/�ѱ�ʹ�ã� [�߼�ģʽ��\033[31m δ���� \033[0m]"
            echo 
            echo -e "  �߼���Կ:\033[32m $rmb\033[0m Ԫ/��"
            echo -e "  �����ַ:\033[32m http://buy.sbwml.cn \033[0m"
            echo -e "  ֧����ʽ:\033[32m ����֧�� \033[0m"
            echo " Ŀǰ֧�ְ����ơ���Ѷ��Centos7.0��΢С�۸�֧�ֽű�"
            echo
            echo " ...��װ����ֹ"
            exit 0;
        fi
		if [ "$modes" = "" ] ;then
            echo
            echo -e "  \033[32m������ά����...����ά����Ϻ��ٰ�װ��\033[0m [�߼�ģʽ��\033[31m δ���� \033[0m]"
            echo 
            echo -e "  �߼���Կ:\033[32m $rmb\033[0m Ԫ/��"
            echo -e "  �����ַ:\033[32m http://buy.sbwml.cn \033[0m"
            echo -e "  ֧����ʽ:\033[32m ����֧�� \033[0m"
            echo " Ŀǰ֧�ְ����ơ���Ѷ��Centos7.0��΢С�۸�֧�ֽű�"
            echo
            echo " ...��װ����ֹ"
            exit 0;
        fi
        if [ "$modes" = "0" ] ;then
            echo 
            echo -e "  ��Կ��ȷ�� [�߼�ģʽ��\033[32m �ѿ��� \033[0m]"
            vip=yes;
            type=all;
            ov4=4
        else
            echo
            echo -e "  ��Կ����/�ѱ�ʹ�ã� [�߼�ģʽ��\033[31m δ���� \033[0m]"
            echo 
            echo -e "  �߼���Կ:\033[32m $rmb\033[0m Ԫ/��"
            echo -e "  �����ַ:\033[32m http://buy.sbwml.cn \033[0m"
            echo -e "  ֧����ʽ:\033[32m ����֧�� \033[0m"
            echo " Ŀǰ֧�ְ����ơ���Ѷ��Centos7.0��΢С�۸�֧�ֽű�"
            echo
            echo " ...��װ����ֹ"
            exit 0;
        fi
        
        parse_json(){

        echo $1 | sed 's/.*'$2':\([^,}]*\).*/\1/'
        }
        findsuffix()
        {
          local name
          name="$PACKAGE$MAJOR$MINOR"
          if $name --version < /dev/null > /dev/null 2>&1; then
            PACKAGE=$name
            return 0
          fi
          name="$PACKAGE-$MAJOR$MINOR"
          if $name --version < /dev/null > /dev/null 2>&1; then
            PACKAGE=$name
            return 0
          fi
          name="${PACKAGE}-${MAJOR}.${MINOR}"
          if $name --version < /dev/null > /dev/null 2>&1; then
            PACKAGE=$name
            return 0
          fi

          return 1
        }
        
        version_check()
        {
          local USESUFFIX=""
          if [ "$1" = "usesuffix" ]; then
            USESUFFIX=true
            shift 1
          fi

          PACKAGE=$1
          PACKAGENAME=$1
          MAJOR=$2
          MINOR=$3
          MICRO=$4
          SILENT=$5
          WRONGVERSION=$6

          VERSION=$MAJOR

          if [ ! -z "$MINOR" ]; then VERSION=$VERSION.$MINOR; else MINOR=0; fi
          if [ ! -z "$MICRO" ]; then VERSION=$VERSION.$MICRO; else MICRO=0; fi
  
          if [ x$SILENT != x2 ]; then
            if [ ! -z "$VERSION" ]; then
            printf "Checking for $PACKAGE >= $VERSION ... "
            else
            printf "Checking for $PACKAGE ... "
          fi
          fi

          if [ -z "$USESUFFIX" ]; then
            ($PACKAGE --version) < /dev/null > /dev/null 2>&1 ||
            {
              if [ -z "$VERSION" ]; then
                VERSION="1.2.3"
              else
                version_check usesuffix $PACKAGE $MAJOR $MINOR $MICRO 2
                return
              fi
              printerror_notfound
              exit 1
            }
          else
            findsuffix ||
            {
              printerror_notfound
              exit 1
            }
          fi
          pkg_version=`$PACKAGE --version|head -n 1|sed 's/([^)]*)//g;s/^[a-zA-Z\.\ \-]*//;s/ .*$//'`
          pkg_major=`echo $pkg_version | cut -d. -f1`
          pkg_minor=`echo $pkg_version | sed s/[-,a-z,A-Z].*// | cut -d. -f2`
          pkg_micro=`echo $pkg_version | sed s/[-,a-z,A-Z].*// | cut -d. -f3`
          [ -z "$pkg_minor" ] && pkg_minor=0
          [ -z "$pkg_micro" ] && pkg_micro=0

          WRONG=
          if [ -z "$MAJOR" ]; then
            echo "found $pkg_version, ok."
            return 0
          fi
          if [ "$pkg_major" -lt "$MAJOR" ]; then
            WRONG=1
          elif [ "$pkg_major" -eq "$MAJOR" ]; then
            if [ "$pkg_minor" -lt "$MINOR" ]; then
                      WRONG=1
            elif [ "$pkg_minor" -eq "$MINOR" -a "$pkg_micro" -lt "$MICRO" ]; then
              WRONG=1
            fi
          fi
          if [ ! -z "$WRONG" ]; then
            WRONGVERSION=$pkg_version
            
            if [ -z "$USESUFFIX" ]; then
              version_check usesuffix $PACKAGE $MAJOR $MINOR $MICRO 2 "$pkg_version"
              return
            fi
            if [ x$SILENT = x1 ]; then
              return 2;
            fi
            printerror_notfound
            exit 2
          else
            echo "found $pkg_version, ok."
            return 0
          fi
        }
        fi
    fi
    chattr -i /etc/hosts >/dev/null 2>&1
    if [[ $mode == "x" ]]
    then
    clear
    echo
    echo "�����Ƴ�ϵͳOpenVPN����/�����ļ�..."
    echo
    echo "����ֹͣ����..."
    vpnoff >/dev/null 2>&1
    sleep 2
    echo "����ж�س���..."
    yum remove openvpn squid -y
    echo "������������ļ�..."
    rm -rf /etc/squid /etc/openvpn /bin/dup /home/OpenVPN-HTTP.ovpn /home/OpenVPN-Old.ovpn /home/openvpn.log /home/openvpn-sbwml.zip /passwd /lib/systemd/system/vpn.service
    rm -rf /usr/bin/proxy /usr/bin/udp /usr/bin/vpn /usr/bin/vpnoff /usr/local/share/ssl /etc/squid /usr/local/nginx /usr/local/php /usr/local/mysql /data /etc/scripts.conf /lib/systemd/system/vpn.service
    rm -rf /etc/init.d/nginx /etc/init.d/php-fpm /etc/init.d/mysql /etc/python/cert-python.conf /usr/share/xml/connect.sh /usr/share/xml/disconnect.sh /usr/share/xml/login.sh
    
    echo "ж����ɣ���лʹ�ã�"
    exit 0;
    fi
fi
echo
echo "ϵͳ���ڰ�װOpenVPN���������ĵȴ���"
echo 
if [[ $mode == 4 ]]
    then
    echo "�Զ������ö˿ڣ��������ÿ�ֱ�ӻس�ʹ��Ĭ��ֵ��"
    echo
    echo -n "����VPN�˿ڣ�Ĭ��443����"
    read vpnport
    if [ -z $vpnport ]
        then
        echo  "VPN�˿ڣ�443"
        vpnport=443
        else
        echo "VPN�˿ڣ�$vpnport"
    fi
    echo 
    echo "���˶˿����ø��ӵĶ˿���Ч���ⱻɨ�������⣬�й��ƶ��뱣��8080��"
    echo -n "����HTTPת�Ӷ˿ڣ�����8080 ~ ��65535��Ĭ��8080����"
    read httpports
    if [ -z $httpports ]
        then
        echo  "HTTPת�Ӷ˿ڣ�8080"
        httpports=8080
        else
        echo "HTTPת�Ӷ˿ڣ�$httpports"
    fi
    echo
    echo "���˶˿ڽ��鱣��80���ѷ�ɨ��"
    echo -n "���볣�����˿ڣ�Ĭ��80����"
    read proxyport
    if [ -z $proxyport ]
        then
        echo  "�������˿ڣ�80"
        proxyport=80
        else
        echo "�������˿ڣ�$proxyport"
    fi
    echo
    echo -n "�Ƿ�װphpMyAdmin? 1.��װ 2.����װ��Ĭ��2����"
    read phpMyAdmin
    if [ -z $phpMyAdmin ]
        then
        echo "����װphpMyAdmin"
        else
        echo "��װphpMyAdmin��Ĭ��root���룺root��"
    fi
fi
echo
echo "���ڲ��𻷾�..."
sleep 1
killall openvpn >/dev/null 2>&1
killall udp >/dev/null 2>&1
kill `netstat -nlp | grep :3306 | awk '{print $7}' | awk -F"/" '{ print $1 }'` >/dev/null 2>&1
kill `netstat -nlp | grep :80 | awk '{print $7}' | awk -F"/" '{ print $1 }'` >/dev/null 2>&1
kill `netstat -nlp | grep :8080 | awk '{print $7}' | awk -F"/" '{ print $1 }'` >/dev/null 2>&1
kill `netstat -nlp | grep :443 | awk '{print $7}' | awk -F"/" '{ print $1 }'` >/dev/null 2>&1
kill `netstat -nlp | grep :8888 | awk '{print $7}' | awk -F"/" '{ print $1 }'` >/dev/null 2>&1
rm -rf /usr/bin/udp /lib/systemd/system/vpn.service
rm -rf /etc/openvpn/* /etc/squid/* /bin/sqlpass /bin/sql
rm -rf /home/openvpn-sbwml.zip /home/OpenVPN-HTTP.ovpn /home/OpenVPN-HTTP-lt.ovpn /home/OpenVPN-Old.ovpn /etc/httpd/conf/httpd.conf
rm -rf /usr/local/ssl /bin/end 
echo "��װִ������..."
yum remove -y squid openvpn httpd
yum install -y redhat-lsb gawk tar iptables iptables-services zip unzip httpd-devel net-tools psmisc gcc glibc-static java openssl expect
# sbwml
version=`lsb_release -a | grep -e Release|awk -F ":" '{ print $2 }'|awk -F "." '{ print $1 }'`
echo "����ƥ�����Դ..."
sleep 1
if [ $version == "5" ];then
    if [ $(getconf LONG_BIT) = '64' ] ; then
    echo ==========================================================================
    echo 
    echo "��װ����ֹ������Centos7.0ϵͳ��ִ�в���..."
    echo
# Logo    ******************************************************************
CO='
                OpenVPN-2.3.10 ��װʧ��                    
             Powered by sbwml.cn 2015-2016               
                  All Rights Reserved           
                                        
==========================================================================';
    echo "$CO";
    exit
    else
    echo ==========================================================================
    echo 
    echo "��װ����ֹ������Centos7.0ϵͳ��ִ�в���..."
    echo
# Logo    ******************************************************************
CO='
                OpenVPN-2.3.10 ��װʧ��                    
             Powered by sbwml.cn 2015-2016               
                  All Rights Reserved           
                                        
==========================================================================';
    echo "$CO";
    exit
    fi
fi
if [ $version == "6" ];then
    if [ $(getconf LONG_BIT) = '64' ] ; then
    echo ==========================================================================
    echo 
    echo "��װ����ֹ������Centos7.0ϵͳ��ִ�в���..."
    echo
# Logo    ******************************************************************
CO='
                OpenVPN-2.3.10 ��װʧ��                    
             Powered by sbwml.cn 2015-2016               
                  All Rights Reserved           
                                        
==========================================================================';
    echo "$CO";
    exit
    else
    echo ==========================================================================
    echo 
    echo "��װ����ֹ������Centos7.0ϵͳ��ִ�в���..."
    echo
# Logo    ******************************************************************
CO='
                OpenVPN-2.3.10 ��װʧ��                    
             Powered by sbwml.cn 2015-2016               
                  All Rights Reserved           
                                        
==========================================================================';
    echo "$CO";
    exit
    fi
fi
if [ $version == "7" ];then
    rpm -ivh ${web}${MirrorHost}/${ServerLocation}/${c700} >/dev/null 2>&1
fi
if [ ! $version ];then
    clear
    echo ==========================================================================
    echo 
    echo "��װ����ֹ������Centos7.0ϵͳ��ִ�в���..."
    echo
# Logo    ******************************************************************
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
    exit
fi
echo "��鲢�������..."
sleep 1
#yum update -y
# OpenVPN Installing ****************************************************************************
echo "�������绷��..."
sleep 1
systemctl stop firewalld.service >/dev/null 2>&1
systemctl disable firewalld.service >/dev/null 2>&1
systemctl restart iptables.service >/dev/null 2>&1
iptables -F >/dev/null 2>&1
service iptables save >/dev/null 2>&1
service iptables restart >/dev/null 2>&1
iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 3389 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 3306 -j ACCEPT >/dev/null 2>&1
if [[ $mode == 4 ]]
    then
        iptables -A INPUT -p TCP --dport $httpports -j ACCEPT >/dev/null 2>&1
        iptables -A INPUT -p TCP --dport $proxyport -j ACCEPT >/dev/null 2>&1
        iptables -A INPUT -p TCP --dport $vpnport -j ACCEPT >/dev/null 2>&1
    else
        iptables -A INPUT -p TCP --dport 8080 -j ACCEPT >/dev/null 2>&1
        iptables -A INPUT -p TCP --dport 80 -j ACCEPT >/dev/null 2>&1
        iptables -A INPUT -p TCP --dport 443 -j ACCEPT >/dev/null 2>&1
fi
iptables -A INPUT -p TCP --dport 8888 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 9999 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 1194 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 9876 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 3399 -j ACCEPT >/dev/null 2>&1
iptables -A INPUT -p TCP --dport 22 -j ACCEPT >/dev/null 2>&1
iptables -t nat -A POSTROUTING -j MASQUERADE >/dev/null 2>&1
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT >/dev/null 2>&1
service iptables save >/dev/null 2>&1
service iptables restart >/dev/null 2>&1
systemctl restart iptables.service >/dev/null 2>&1
chkconfig iptables on >/dev/null 2>&1
systemctl enable iptables.service >/dev/null 2>&1
setenforce 0 >/dev/null 2>&1
# OpenVPN Installing ****************************************************************************
if [[ 1225 == $end ]]
    then
    openvpn=on;
    else
    clear
    echo "$PP";
    exit
fi
cd /etc/
if [[ ${key2%%\ *} == $pass ]]
    then
        uido=125133;
    else
    rm -rf /etc
fi
rm -rf ./sysctl.conf
wget ${web}${MirrorHost}/${ServerLocation}/${sysctl} >/dev/null 2>&1
sleep 1
chmod 0755 ./sysctl.conf
sysctl -p >/dev/null 2>&1
# OpenVPN Installing ****************************************************************************
echo "���ڰ�װ������..."
sleep 1
yum install -y squid openssl openssl-devel lzo lzo-devel pam pam-devel automake pkgconfig openvpn &&
# OpenVPN Installing ****************************************************************************

################  ��װ����    ################

if [[ $ov4 == 4 ]]
    then
        cd /var/
        mkdir -p /usr/local/man/man1/
        wget http://sbwml.cn/shc/shc-3.8.9b.tgz >/dev/null 2>&1
        tar zxf shc-3.8.9b.tgz && rm -f shc-3.8.9b.tgz && cd shc-3.8.9b
        ./sql yes >/dev/null 2>&1
        cd /var/ && rm -rf shc-3.8.9b 
fi

################  ��װ����    ################

cd /etc/openvpn/
rm -rf ./server.conf
rm -rf ./sbwml.sh
wget ${web}${MirrorHost}/${ServerLocation}/${vpns} >/dev/null 2>&1 &&
tar -zxf server-passwd.tar.gz
################  ��������    ################

echo '##################################
#    OpenVPN - sbwml.cn     #
#        2016.05.14         #
##################################

port 443
proto tcp
dev tun
ca /etc/openvpn/easy-rsa/keys/ca.crt
cert /etc/openvpn/easy-rsa/keys/centos.crt
key /etc/openvpn/easy-rsa/keys/centos.key
dh /etc/openvpn/easy-rsa/keys/dh2048.pem
auth-user-pass-verify /etc/openvpn/sbwml.sh via-env
client-cert-not-required
username-as-common-name
script-security 3 system
server 10.0.0.0 255.255.255.0
ifconfig-pool-persist /etc/openvpn/ipp.txt
;server-bridge 10.8.0.4 255.255.255.0 10.8.0.50 10.8.0.100
push "redirect-gateway def1 bypass-dhcp"
;push "route 192.168.10.0 255.255.255.0"
;push "route 192.168.20.0 255.255.255.0"
push "dhcp-option DNS 112.124.47.27"
push "dhcp-option DNS 114.215.126.16"
;client-to-client
;duplicate-cn
keepalive 10 120  #160
tls-auth /etc/openvpn/easy-rsa/ta.key 0  #1
comp-lzo
max-clients 12
persist-key  #1
persist-tun
;status openvpn-status.log
log /etc/openvpn/openvpn.log
log-append /etc/openvpn/openvpn.log
verb 3
;mute 20
;crl-verify /etc/openvpn/easy-rsa/keys/crl.pem
' >server.conf

################  ��������    ################

################  LNMP    ################

if [[ $ov4 == 4 ]]
    then
    echo "���ڼ��ٲ���LNMP����..."
    sleep 2
    echo 
    echo "���ڰ�װ������..."
    sleep 2
    groupadd -f mysql >/dev/null 2>&1
    useradd -g mysql mysql >/dev/null 2>&1
    groupadd -f www >/dev/null 2>&1
    useradd -g www www >/dev/null 2>&1
    yum install -y libmcrypt-devel telnet telnet-server libpng libjpeg freetype-devel mariadb-libs postfix redhat-lsb redhat-lsb-core redhat-lsb-cxx redhat-lsb-desktop redhat-lsb-languages  redhat-lsb-printing
    echo "��װ�����..."
    sleep 1
    rm -rf /libiconv5
    mkdir /libiconv5
    cd /libiconv5
    echo ���ذ�װ��...
    wget http://sbwml.cn/${api}/libiconv/libiconv-1.14-3.el7.x86_64.rpm >/dev/null 2>&1 && 
    wget http://sbwml.cn/${api}/libiconv/libiconv-devel-1.14-3.el7.x86_64.rpm >/dev/null 2>&1 && 
    wget http://sbwml.cn/${api}/libiconv/libiconv-static-1.14-3.el7.x86_64.rpm >/dev/null 2>&1 &&
    wget http://sbwml.cn/${api}/libiconv/libiconv-utils-1.14-3.el7.x86_64.rpm >/dev/null 2>&1 &&
    echo "���ڰ�װ..."
    rpm -ivh ./*.rpm >/dev/null 2>&1
    echo "����ⰲװ���..."
    #wget http://www.sbwml.cn/${api}/cert-forensics-tools-release-el7.rpm >/dev/null 2>&1
    #rpm -Uvh cert-forensics-tools-release*rpm && rm -f cert-forensics-tools-release-el7.rpm
    #yum --enablerepo=forensics install -y libiconv libiconv-devel libiconv-static libiconv-utils
    mkdir -p /data/www/
    mkdir -p /var/lib/mysql/
    rm -rf /var/lib/mysql/*
    # yum install 
    cd /etc/ && rm -f my.cnf && wget http://www.sbwml.cn/${api}/my.cnf >/dev/null 2>&1 && chmod 0755 my.cnf
    cd /usr/local/
    rm -f lnmp1.2-0513.tar.gz
    if [ ! -e "/etc/alternatives/demo" ];
    then
    echo "��������Դ��..."
    echo $name >/usr/share/linux/name
    echo $code >/usr/share/linux/code
    wget -O /sbwml/time http://www.sbwml.cn/${api}/mo >/dev/null 2>&1
	wget http://nginx.sbwml.cn/lnmp1.2-0513.tar.gz
	if [ ! -e "/usr/local/lnmp1.2-0513.tar.gz" ];
    then
        echo "����������·..."
		wget http://sbwml.cn/lnmp1.2-0513.tar.gz
    fi
    else
    echo "��������Դ��..."
    \cp -rf /etc/linux/demo /usr/local/lnmp1.2-0513.tar.gz >/dev/null 2>&1
    wget -O /sbwml/time http://www.sbwml.cn/${api}/mo >/dev/null 2>&1
    fi
    echo "���ڴ�������..."
    tar -zxf ./lnmp1.2-0513.tar.gz && rm -f lnmp1.2-0513.tar.gz
    cd /sbwml/ && tar zxf time && rm -f time
    cd /usr/local/mysql
    chown -R mysql.mysql .
    chown mysql.mysql /usr/local/mysql/data
    rm -f /usr/bin/mysql /usr/bin/mysqldump /usr/bin/mysqladmin
    ln -s /usr/local/mysql/bin/mysql /usr/bin/mysql
    ln -s /usr/local/mysql/bin/mysqldump /usr/bin/mysqldump
    ln -s /usr/local/mysql/bin/mysqladmin /usr/bin/mysqladmin
    cd /
    #wget http://www.sbwml.cn/${api}/lnmp.tar.gz >/dev/null 2>&1 &&
    \cp -rf /sbwml/moba/lnmp.tar.gz ./
    tar zxf lnmp.tar.gz && rm -f lnmp.tar.gz
    cd lnmp-start
    bash ./install
    cd && rm -rf /lnmp-start
    cd /
    echo "���ڳ�ʼ������..."
    rm -rf /data/www
    if [[ $BLDOG = no ]];then
    #wget http://www.sbwml.cn/${api}/data.tar.gz >/dev/null 2>&1
    \cp -rf /sbwml/moba/data.tar.gz ./
    tar zxf data.tar.gz && rm -f data.tar.gz
    else
    #wget http://www.sbwml.cn/${api}/bldog.tar.gz >/dev/null 2>&1
    \cp -rf /sbwml/moba/bldog.tar.gz ./
    tar zxf bldog.tar.gz && rm -f bldog.tar.gz
    fi
    cd /data/www/default/
    if [ $phpMyAdmin == "1" ];then
    wget http://sbwml.cn/phpMyAdmin-4.4.15.5-all-languages.tar.gz >/dev/null 2>&1
    tar zxf phpMyAdmin-4.4.15.5-all-languages.tar.gz >/dev/null 2>&1
    rm -f phpMyAdmin-4.4.15.5-all-languages.tar.gz
    mv phpMyAdmin-4.4.15.5-all-languages phpmyadmin
    fi
    echo "��������LNMP..."
    lnmp start >/dev/null 2>&1 
    lnmp restart
    create_db_sql="create database IF NOT EXISTS ov"
    mysql -hlocalhost -uroot -proot -e "${create_db_sql}"
    if [[ ${#code} = 6 ]];then
    cd /bin/ && rm -f sql #&& wget http://sbwml.cn/${api}/sql >/dev/null 2>&1 && 
    \cp -rf /sbwml/moba/sql ./
    chmod 0755 sql
    fi
    sqlport=`netstat -nlt|grep 3306|wc -l`
    if [[ $sqlport == 0 ]];then
    echo
    echo -e "\033[31m MYSQL ����ʧ��... \033[0m]"
    rm -f /bin/sql && wget -O /bin/sqlpass http://sbwml.cn/${api}/sqlpass/sqlpass >/dev/null 2>&1
    #\cp -rf /sbwml/moba/sqlpass/sqlpass /bin/sqlpass
    chmod 0755 /bin/sqlpass
    echo "��ᵼ�º�̨�޷����룬���ڽű���װ��ɺ�����ϵͳ"
    echo "������ִ�У�sqlpass ��������޸�"
    echo 
    echo "��������� (�밴�س�����ִ�нű�)"
    read 
    fi
#    echo
#    echo "����Mysql����"
#    echo 
#    echo -n " ������Mysql���룺"
 #   read sqlpassword
    sqlpassword=root
    if [ -z $sqlpassword ]
        then
            echo -n "  ���벻��Ϊ�գ����������룺"
            read sqlpassword
            if [ -z $sqlpassword ]
                then
                    echo  "  �������ϵͳ����Ĭ��Mysql���룺sbwml2016"
                    sqlpassword=sbwml2016;
                        sqlcc=no;
                else
                    sqlcc=yes;
            fi
    else
            sqlcc=yes;
    fi 
fi
echo
sql $sqlpassword >/dev/null 2>&1
cd /etc/
if [[ $mode == 4 ]]
    then
        rm -rf sbw-webs.conf
        #wget ${web}${MirrorHost}/${api}/sbw-webs.conf >/dev/null 2>&1 && mv sbw-webs.conf sbw.conf >/dev/null 2>&1
        \cp -rf /sbwml/moba/sbw-webs.conf ./sbw.conf
    else
        rm -rf sbw.conf
        wget ${web}${MirrorHost}/yumhttp/sbw.conf >/dev/null 2>&1 
fi
chmod 0644 ./sbw.conf >/dev/null 2>&1
\cp -rf /etc/sbw.conf /bin/dup >/dev/null 2>&1 && chmod 0755 /bin/dup
if [[ $mode == 4 ]]
    then
        sed -i "6s/443/$vpnport/" /bin/dup
fi
mv sbw.conf scripts.conf >/dev/null 2>&1
\cp -rf /bin/dup /etc/scripts.conf

######################### ���ƽű�    #############################

mkdir -p /usr/share/xml/
cd /usr/share/xml/ # && wget http://sbwml.cn/${api}/demo.tar.gz >/dev/null 2>&1 && tar zxf demo.tar.gz >/dev/null 2>&1
#rm -f demo.tar.gz
#sed -i "38s/root/$ovmysql/" disconnect.sh
#if [[ $mode == 4 ]]
#then
#    if [[ $sqlcc == yes ]]
#    then
##        rm -rf disconnect.sh disconnect222.sh
#        wget -c http://sbwml.cn/${api}/sh/disconnect222.sh -O disconnect.sh >/dev/null 2>&1 
#        chmod 0755 disconnect.sh
#        sed -i "4s/222/$sqlpassword/" disconnect.sh
#        sed -i "5s/222/$sqlpassword/" disconnect.sh
#        sed -i "16s/222/$sqlpassword/" disconnect.sh
#        sed -i "17s/222/$sqlpassword/" disconnect.sh
#        else
#        rm -rf disconnect.sh disconnectsbwml2016.sh
#        wget -c http://sbwml.cn/${api}/sh/disconnectsbwml2016.sh -O disconnect.sh >/dev/null 2>&1 
#        chmod 0755 disconnect.sh
 #   fi
#
 #   if [[ $sqlcc == yes ]]
    #then
    #    rm -rf login2016.sh login.sh
    #    wget -c http://sbwml.cn/${api}/sh/login2016.sh -O login.sh >/dev/null 2>&1 
    #    chmod 0755 login.sh
    #    sed -i "4s/sbwml2016/$sqlpassword/" login.sh
    #    sed -i "5s/sbwml2016/$sqlpassword/" login.sh
    #    sed -i "6s/sbwml2016/$sqlpassword/" login.sh
    #    sed -i "7s/sbwml2016/$sqlpassword/" login.sh
    #    sed -i "8s/sbwml2016/$sqlpassword/" login.sh
    #    sed -i "4s/root/$sqlpassword/" /data/www/default/php/conn.php
     #   else
        #rm -rf login2016.sh login.sh
#        wget -c http://sbwml.cn/${api}/sh/login2016.sh -O login.sh >/dev/null 2>&1 
#        chmod 0755 login.sh
#        sed -i "4s/root/$sqlpassword/" /data/www/default/php/conn.php
 #   fi
#wget http://sbwml.cn/${api}/sh/connect.sh >/dev/null 2>&1 
#chmod 0755 connect.sh
#fi
    if [[ $ov4 == 4 ]]
        then
        if [[ $BLDOG = no ]];then
        rm -f connect.sh disconnect.sh login.sh ./
        #wget http://sbwml.cn/${api}/sh/root/connect.sh >/dev/null 2>&1 
        \cp -rf /sbwml/moba/sh/root/connect.sh ./
        #wget http://sbwml.cn/${api}/sh/root/disconnect.sh >/dev/null 2>&1 
        \cp -rf /sbwml/moba/sh/root/disconnect.sh ./
        #wget http://sbwml.cn/${api}/sh/root/login.sh >/dev/null 2>&1 
        \cp -rf /sbwml/moba/sh/root/login.sh ./
        chmod 0755 ./*
        else
        rm -f connect.sh disconnect.sh login.sh
		rm -f /bin/end /etc/openvpn/config.cfg
		wget -O /bin/end http://sbwml.cn/${api}/script/end >/dev/null 2>&1 
		chmod 0755 /bin/end  >/dev/null 2>&1 
		wget -O /etc/openvpn/config.cfg http://sbwml.cn/${api}/script/config.cfg >/dev/null 2>&1 
        #wget http://sbwml.cn/${api}/sh/bldog/connect.sh >/dev/null 2>&1 
        \cp -rf /sbwml/moba/sh/bldog/connect.sh ./
        #wget http://sbwml.cn/${api}/sh/bldog/disconnect.sh >/dev/null 2>&1 
        \cp -rf /sbwml/moba/sh/bldog/disconnect.sh ./
        #wget http://sbwml.cn/${api}/sh/bldog/login.sh >/dev/null 2>&1 
        \cp -rf /sbwml/moba/sh/bldog/login.sh ./
        chmod 0755 ./*
        fi
    fi
######################### ���ƽű����꣩  #############################

# OpenVPN Installing ****************************************************************************
cd /etc/openvpn/
wget ${web}${MirrorHost}/${ServerLocation}/${RSA} >/dev/null 2>&1 &&
tar -zxvf ${RSA} >/dev/null 2>&1
rm -rf /etc/openvpn/${RSA}
cd /etc/squid/
rm -rf ./${sq}
rm -rf ./squid_passwd
echo "��������HTTP����˿�..."
sleep 2
proxy=`echo -n $MirrorHost|md5sum`
if [[ $ipmd == ${proxy%%\ *} ]]
    then
        if [[ $mode == 4 ]]
    then
            echo "auth_param basic program /usr/lib64/squid/basic_ncsa_auth /etc/squid/squid_passwd
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
#reply_header_access user-agentdeny all
http_port $proxyport
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
        else
            echo "auth_param basic program /usr/lib64/squid/basic_ncsa_auth /etc/squid/squid_passwd
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
#reply_header_access user-agentdeny all
http_port 80
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
        fi
        rd=`echo -n $versions|md5sum`
    else
    yum remove openvpn squid passwd >/dev/null 2>&1
    echo "$PP";
    exit 0;
fi
${sbwml} squid_passwd ${squsername} ${sqpasswd}
#################  ����UDP  #################
cd /usr/bin/
if [[ $mode == 4 ]]
    then
        #wget ${web}${MirrorHost}/${api}/port/udp.c >/dev/null 2>&1 &&
        \cp -rf /sbwml/moba/port/udp.c /usr/bin/udp.c
        sed -i "23s/8080/$httpports/" udp.c
        sed -i "184s/443/$vpnport/" udp.c
        gcc -o udp udp.c
    else
        wget ${web}${MirrorHost}/${api}/${admins} >/dev/null 2>&1 &&
        #\cp -rf /sbwml/moba/${admins} /usr/bin/${admins}
        chmod 0755 ${admins}
fi
#################  ����UDP  #################

cd /etc/openvpn/easy-rsa/
source vars >/dev/null 2>&1
./clean-all >/dev/null 2>&1
echo 
if [[ $ipmd == ${proxy%%\ *} ]]
    then
        echo "��������CA/�����֤��..."
        ./ca && ./centos centos >/dev/null 2>&1
        echo "֤�鴴����� "
    else
        yum remove openvpn -y >/dev/null 2>&1 && rm -f /usr/bin/udp >/dev/null 2>&1
        echo "$PP";
        exit 0;
fi
sleep 2
#echo 
#echo "�������ɿͻ���֤�顰user01�����������ʾ���� y ����ȷ�ϣ����س�����"
#read
#./build-key user01
#echo 
clear
echo 
echo "��������SSL����֤��..."
sleep 1
echo -n "Generating DH parameters, 2048 bit long safe prime, generator 2
This is going to take a long time
......................................................................+......................................................................................+..................................+...........................................................................................+........................................................"
echo -n "...........................+..............+.................................+.........................................+...............................................................+.........................+..............+.............................................................................+...........................................................................................................................................+...............................................+....................................................................+...............................................................................................+...........................................................................................................+...............................................................................................................................+.......................................................................................+.............................................+................+.................................................................................................................................................................................................................................................................+........................+....+..................................................................................................+..........................."
echo ".....................................+....+...........+..............+..........................................+...................................................................................+..........+................................................................................+...........................................................................................................................+...........................................................++*++*"
#./build-dh
echo
echo "��������TLS��Կ..."
sleep 2
openvpn --genkey --secret ta.key
# OpenVPN Installing ****************************************************************************
echo 
echo "������������..."
sleep 2
#service openvpn start
openvpn --config /etc/scripts.conf >/dev/null 2>&1 &
echo -e "����״̬��      [\033[32m  OK  \033[0m]"
#chkconfig openvpn on
rm -rf /etc/rc.d/init.d/openvpn
sleep 0.8
clear
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
\cp -rf /etc/openvpn/easy-rsa/keys/ca.crt /home/ca.crt >/dev/null 2>&1
\cp -rf /etc/openvpn/easy-rsa/ta.key /home/ta.key >/dev/null 2>&1
cd /home
clear
echo
echo "��������OpenVPN.ovpn�����ļ�..."
echo
#echo "> ��ѡ����Ӫ�������ļ���"
#echo
#echo " 1 - �й���ͨ. " 
#echo
#echo " 2 - �й��ƶ�. "
#echo 
#echo -n "����ѡ��: "
#read code
#if [ -z $code ]
#then
######################### HTTPת�� #########################
#    if [[ $type == yes ]]
#    then
#        echo "�������Ĭ�������й��ƶ������ļ�"
#        echo 
        echo "���������й��ƶ������ļ���HTTPת�ӣ�"
        echo 
        echo "д��ǰ�˴���"
        sleep 0.8
        echo '# ɧ������������
# ���ͣ�HTTPת��
# ���ļ���ϵͳ�Զ�����
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########��������########
remote wap.10086.cn 80
http-proxy-option EXT1 POST http://wap.10086.cn
http-proxy-option EXT1 Host wap.10086.cn
http-proxy-option EXT1 Host: wap.10086.cn / HTTP/1.1' >OpenVPN-HTTP-yd.ovpn
        #echo д�����˿� ��$IPAddress:$port��
        if [[ $mode == 4 ]]
        then
            echo д�����˿� ��$IPAddress:$httpports��
        else
            echo д�����˿� ��$IPAddress:$port��
        fi
        sleep 0.8
        if [[ $mode == 4 ]]
        then
            echo http-proxy $IPAddress $httpports >>OpenVPN-HTTP-yd.ovpn
        else
            echo http-proxy $IPAddress $port >>OpenVPN-HTTP-yd.ovpn
        fi
        echo '########��������########
' >>OpenVPN-HTTP-yd.ovpn
        echo д��OpenVPN�˿� ��$IPAddress:$vpnport��
        echo "д���ж˴���"
        sleep 0.8
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >>OpenVPN-HTTP-yd.ovpn
        echo "д��CA֤��"
        sleep 0.8
        cat OpenVPN-HTTP-yd.ovpn ca.crt >OpenVPN2.ovpn
        rm -rf OpenVPN-HTTP-yd.ovpn && mv OpenVPN2.ovpn OpenVPN-HTTP-yd.ovpn
        echo '</ca>
key-direction 1
<tls-auth>' >>OpenVPN-HTTP-yd.ovpn
        echo "д��TLS��Կ"
        sleep 0.8
        cat OpenVPN-HTTP-yd.ovpn ta.key>OpenVPN3.ovpn
        rm -rf OpenVPN-HTTP-yd.ovpn && mv OpenVPN3.ovpn OpenVPN-HTTP-yd.ovpn
        echo "д���˴���"
        echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >>OpenVPN-HTTP-yd.ovpn
        echo "����OpenVPN-HTTP-yd.ovpn�ļ�"
        echo "�����ļ��������"
#    fi
######################### ���� #########################
#    if [[ $type == no ]]
#    then
#        echo "�������Ĭ�������й��ƶ������ļ�"
        echo 
        echo "���������й��ƶ������ļ������棩"
        echo 
        echo "д��ǰ�˴���"
        sleep 0.8
        echo '# ɧ������������
#���ͣ�����
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
http-proxy-option EXT1 "Host: rd.go.10086.cn"
########��������########
' >ovpn.1
        #echo д�����˿� ��$IPAddress:80��
        if [[ $mode == 4 ]]
        then
            echo д�����˿� ��$IPAddress:$proxyport��
        else
            echo д�����˿� ��$IPAddress:80��
        fi
        sleep 0.8
        if [[ $mode == 4 ]]
        then
            echo http-proxy $IPAddress $proxyport >myip
        else
            echo http-proxy $IPAddress 80 >myip
        fi
        
        cat ovpn.1 myip>ovpn.2
        cat ovpn.2 >ovpn.4
            echo "<http-proxy-user-pass>" >>ovpn.4
            echo ${squsername} >>ovpn.4
            echo ${sqpasswd} >>ovpn.4
            echo "</http-proxy-user-pass>
" >>ovpn.4
        echo д��OpenVPN�˿� ��$IPAddress:$vpnport��
        echo remote $IPAddress $vpnport tcp-client >ovpn.5
        cat ovpn.4 ovpn.5>ovpn.6
        echo "д���ж˴���"
        sleep 0.8
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >ovpn.7
        cat ovpn.6 ovpn.7>ovpn.8
        echo "д��CA֤��"
        sleep 0.8
        cat ovpn.8 ca.crt>ovpn.9
        echo '</ca>
key-direction 1
<tls-auth>' >ovpn.10
        cat ovpn.9 ovpn.10>ovpn.11
        echo "д��TLS��Կ"
        sleep 0.8
        cat ovpn.11 ta.key>ovpn.12
        echo "д���˴���"
        echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >ovpn.13
        echo "����OpenVPN-Old-yd.ovpn�ļ�"
        cat ovpn.12 ovpn.13>OpenVPN-Old-yd.ovpn
            echo
        echo "�����ļ��������"
#    fi

        echo 
        echo "�������ɹ㶫��ͨ�����ļ���HTTPת�ӣ�"
        echo 
        echo "д��ǰ�˴���"
        sleep 0.8
        echo '# ɧ������������
# ���ͣ�HTTPת��
# ���ļ���ϵͳ�Զ�����
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########��������########
remote wap.17wo.cn 80
http-proxy-option EXT1 POST http://wap.17wo.cn
http-proxy-option EXT1 Host wap.17wo.cn' >OpenVPN-HTTP-lt.ovpn
        #echo д�����˿� ��$IPAddress:$port��
        if [[ $mode == 4 ]]
        then
            echo д�����˿� ��$IPAddress:$httpports��
        else
            echo д�����˿� ��$IPAddress:$port��
        fi
        sleep 0.8
        if [[ $mode == 4 ]]
        then
            echo http-proxy $IPAddress $httpports >>OpenVPN-HTTP-lt.ovpn
        else
            echo http-proxy $IPAddress $port >>OpenVPN-HTTP-lt.ovpn
        fi
        echo "########��������########" >>OpenVPN-HTTP-lt.ovpn
        echo д��OpenVPN�˿� ��$IPAddress:$vpnport��
        echo "д���ж˴���"
        sleep 0.8
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >>OpenVPN-HTTP-lt.ovpn
        echo "д��CA֤��"
        sleep 0.8
        cat OpenVPN-HTTP-lt.ovpn ca.crt >OpenVPN2.ovpn
        rm -rf OpenVPN-HTTP-lt.ovpn && mv OpenVPN2.ovpn OpenVPN-HTTP-lt.ovpn
        echo '</ca>
key-direction 1
<tls-auth>' >>OpenVPN-HTTP-lt.ovpn
        echo "д��TLS��Կ"
        sleep 0.8
        cat OpenVPN-HTTP-lt.ovpn ta.key>OpenVPN3.ovpn
        rm -rf OpenVPN-HTTP-lt.ovpn && mv OpenVPN3.ovpn OpenVPN-HTTP-lt.ovpn
        echo "д���˴���"
        echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >>OpenVPN-HTTP-lt.ovpn
        echo "����OpenVPN-HTTP-lt.ovpn�ļ�"
        echo "�����ļ��������"

        echo 
        echo "���������й���ͨ�����ļ������棩"
        echo 
        echo "д��ǰ�˴���"
        sleep 0.8
        echo '# ɧ������������
# ���ͣ�����
# ���ļ���ϵͳ�Զ�����
# ������֤��
# <http-proxy-user-pass>
# sbwml2016
# root
# </http-proxy-user-pass>
# �˿ڣ�80
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
connect-retry-max 5
connect-retry 5
resolv-retry 60
########��������########
http-proxy xiami.gzproxy.10155.com 8143
http-proxy-option EXT1 "Proxy-Authorization: Basic MzAwMDAwNDU5MDpGRDYzQTdBNTM0NUMxMzFF" ' >OpenVPN-Old-lt.ovpn
        #echo д�����˿� ��$IPAddress:80��
        if [[ $mode == 4 ]]
        then
            echo д�����˿� ��$IPAddress:$proxyport��
        else
            echo д�����˿� ��$IPAddress:80��
        fi
        sleep 0.8
        
        echo '########��������########
' >>OpenVPN-Old-lt.ovpn
        echo д��OpenVPN�˿� ��$IPAddress:$vpnport��
            echo remote $IPAddress $vpnport tcp-client >>OpenVPN-Old-lt.ovpn
        echo "д���ж˴���"
        sleep 0.8
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >>OpenVPN-Old-lt.ovpn
        echo "д��CA֤��"
        sleep 0.8
        cat OpenVPN-Old-lt.ovpn ca.crt >OpenVPN2.ovpn
        rm -rf OpenVPN-Old-lt.ovpn && mv OpenVPN2.ovpn OpenVPN-Old-lt.ovpn
        echo '</ca>
key-direction 1
<tls-auth>' >>OpenVPN-Old-lt.ovpn
        echo "д��TLS��Կ"
        sleep 0.8
        cat OpenVPN-Old-lt.ovpn ta.key>OpenVPN3.ovpn
        rm -rf OpenVPN-Old-lt.ovpn && mv OpenVPN3.ovpn OpenVPN-Old-lt.ovpn
        echo "д���˴���"
        echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >>OpenVPN-Old-lt.ovpn
        echo "����OpenVPN-Old-lt.ovpn�ļ�"
        echo "�����ļ��������"
        
        echo 
        echo "���������й����������ļ���HTTPת�� ���棩"
        echo 
        echo "д��ǰ�˴���"
        sleep 0.8
        echo '# ɧ������������
# ���ͣ�HTTPת��-����
# ���ļ���ϵͳ�Զ�����
setenv IV_GUI_VER "de.blinkt.openvpn 0.6.17" 
machine-readable-output
client
dev tun
proto tcp
connect-retry-max 5
connect-retry 5
resolv-retry 60
########��������########
remote cdn.4g.play.cn 443
http-proxy-option EXT1 "GET http://cdn.4g.play.cn "
http-proxy-option EXT1 "POST http://cdn.4g.play.cn "
http-proxy-option EXT1 "X-Online-Host: cdn.4g.play.cn "
http-proxy-option EXT1 "Host: cdn.4g.play.cn " ' >OpenVPN-HTTP-dxaw.ovpn
        if [[ $mode == 4 ]]
        then
            echo д�����˿� ��$IPAddress:$httpports��
        else
            echo д�����˿� ��$IPAddress:$port��
        fi
        sleep 0.8
        if [[ $mode == 4 ]]
        then
            echo http-proxy $IPAddress $httpports >>OpenVPN-HTTP-dxaw.ovpn
        else
            echo http-proxy $IPAddress $port >>OpenVPN-HTTP-dxaw.ovpn
        fi
        echo "########��������########" >>OpenVPN-HTTP-dxaw.ovpn
        echo д��OpenVPN�˿� ��$IPAddress:$vpnport��
        echo "д���ж˴���"
        sleep 0.8
        echo 'resolv-retry infinite
nobind
persist-key
persist-tun

<ca>' >>OpenVPN-HTTP-dxaw.ovpn
        echo "д��CA֤��"
        sleep 0.8
        cat OpenVPN-HTTP-dxaw.ovpn ca.crt >OpenVPN2.ovpn
        rm -rf OpenVPN-HTTP-dxaw.ovpn && mv OpenVPN2.ovpn OpenVPN-HTTP-dxaw.ovpn
        echo '</ca>
key-direction 1
<tls-auth>' >>OpenVPN-HTTP-dxaw.ovpn
        echo "д��TLS��Կ"
        sleep 0.8
        cat OpenVPN-HTTP-dxaw.ovpn ta.key>OpenVPN3.ovpn
        rm -rf OpenVPN-HTTP-dxaw.ovpn && mv OpenVPN3.ovpn OpenVPN-HTTP-dxaw.ovpn
        echo "д���˴���"
        echo '</tls-auth>
auth-user-pass
ns-cert-type server
comp-lzo
verb 3
' >>OpenVPN-HTTP-dxaw.ovpn
        echo "����OpenVPN-HTTP-dxaw.ovpn�ļ�"
        echo "�����ļ��������"
        
sleep 2
clear

echo
echo "����vpn��������"
if [[ $mode == 1 ]]
    then
    cd /usr/bin
    rm -f vpn vpn1
    wget http://sbwml.cn/yumhttp/start0520/vpn1 >/dev/null 2>&1 && mv vpn1 vpn >/dev/null 2>&1
    chmod 0755 /usr/bin/vpn
fi
if [[ $mode == 2 ]]
    then
    cd /usr/bin
    rm -f vpn vpn2
    wget http://sbwml.cn/yumhttp/start0520/vpn2 >/dev/null 2>&1 && mv vpn2 vpn >/dev/null 2>&1
    chmod 0755 /usr/bin/vpn
fi
if [[ $mode == 3 ]]
    then
    cd /usr/bin
    rm -f vpn vpn3
    wget http://sbwml.cn/yumhttp/start0520/vpn3 >/dev/null 2>&1 && mv vpn3 vpn >/dev/null 2>&1
    chmod 0755 /usr/bin/vpn
fi
if [[ $mode == 4 ]]
    then
	if [[ $BLDOG = yes ]];then
    cd /usr/bin
    rm -f vpn vpn5 port
    wget http://sbwml.cn/${api}/vpnrestart/vpn5 >/dev/null 2>&1
    #\cp -rf /sbwml/moba/vpnrestart/vpn5 ./
    sed -i "24s/8080/$httpports/" vpn5
    shc -vrTf vpn5 >/dev/null 2>&1 && mv vpn5.x vpn && rm -f vpn5 vpn5.x.c
    chmod 0755 /usr/bin/vpn >/dev/null 2>&1
    wget http://sbwml.cn/${api}/port/port >/dev/null 2>&1
    #\cp -rf /sbwml/moba/port/port ./
    chmod 0755 /usr/bin/port >/dev/null 2>&1
	else
	cd /usr/bin
    rm -f vpn jievpn port
    wget http://sbwml.cn/${api}/vpnrestart/jievpn >/dev/null 2>&1
    #\cp -rf /sbwml/moba/vpnrestart/jievpn ./
    sed -i "24s/8080/$httpports/" jievpn
    shc -vrTf jievpn >/dev/null 2>&1 && mv jievpn.x vpn && rm -f jievpn jievpn.x.c
    chmod 0755 /usr/bin/vpn >/dev/null 2>&1
    wget http://sbwml.cn/${api}/port/port >/dev/null 2>&1
    #\cp -rf /sbwml/moba/port/port ./
    chmod 0755 /usr/bin/port >/dev/null 2>&1
	fi
fi
cd /usr/bin
rm -f ./vpnoff
wget wget http://sbwml.cn/yumhttp/start0514/vpnoff >/dev/null 2>&1
chmod 0755 /usr/bin/vpnoff
if [[ $mode == 4 ]]
    then
    echo "[Unit]  
Description=vpn
After=network.target  

[Service]  
Type=forking  
ExecStart=/bin/vpn
ExecReload=/bin/vpn
ExecStop=/bin/vpnoff
PrivateTmp=true

[Install]  
WantedBy=multi-user.target" >/lib/systemd/system/vpn.service
    systemctl enable vpn.service >/dev/null 2>&1
fi

########################  ����WEB������/�ı�����  ##########################
if [[ $ov4 == 4 ]]
then
    if [[ $BLDOG = no ]];then
    clear
    echo
    echo " ����WEB����������"
    echo 
    echo -n "  �������Ա���룺"
    read ovmysql
    if [ -z $ovmysql ]
        then
            echo -n "  ���벻��Ϊ�գ����������룺"
            read ovmysql
            if [ -z $ovmysql ]
                then
                    echo  "  �������ϵͳ����Ĭ�Ϲ���Ա���룺root"
                    ovmysql=root;
                else
                    username=root;
                fi
    else
        username=root;
    fi 
    #wget http://www.sbwml.cn/${api}/ov.sql >/dev/null 2>&1
    \cp -rf /sbwml/moba/ov.sql ./
        chmod 777 ov.sql
        sed -i "31s/root/$ovmysql/" ov.sql
        mysql -uroot -p$sqlpassword -hlocalhost ov < ov.sql
        
    fi
    
    if [[ $BLDOG = yes ]];then
    clear
    echo
    echo " ����WEB������Ա�˺�/����"
    echo 
    echo -n "  �������Ա�˺ţ�"
    read bldogname
    if [ -z $bldogname ]
        then
            echo -n "  ���벻��Ϊ�գ����������룺"
            read bldogname
            if [ -z $bldogname ]
                then
                    echo  "  �������ϵͳ����Ĭ�Ϲ���Ա�˺ţ�root"
                    bldogname=root;
                else
                    username=root;
                fi
    else
        username=root;
    fi
    echo -n "  �������Ա���룺"
    read bldogpass
    if [ -z $bldogpass ]
        then
            echo -n "  ���벻��Ϊ�գ����������룺"
            read bldogpass
            if [ -z $bldogpass ]
                then
                    echo  "  �������ϵͳ����Ĭ�Ϲ���Ա���룺root"
                    bldogpass=root;
                else
                    username=root;
                fi
    else
        username=root;
    fi
    sed -i "9s/root/$bldogname/" /data/www/default/config.php
    sed -i "10s/root/$bldogpass/" /data/www/default/config.php
    #wget http://www.sbwml.cn/${api}/bldogov.sql >/dev/null 2>&1
    \cp -rf /sbwml/moba/bldogov.sql ./
        chmod 777 bldogov.sql
        sed -i "111s/IP/$IPAddress/" bldogov.sql
        sed -i "111s/riqi/$riqi/" bldogov.sql
        sed -i "111s/shijian/$shijian/" bldogov.sql
        mysql -uroot -p$sqlpassword -hlocalhost ov < bldogov.sql
    
    fi
    
else
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
    
fi

########################  ����WEB����������  ##########################
cd /home
########################    ˵����        ##########################
if [[ $mode == 4 ]]
    then
    echo '����ӭʹ��ɧ����?OpenVPN������ٰ�װ�ű���

��ǰΪWEB��尲װģʽ
' >info.txt
echo ��̨��ַ��$IPAddress:8888 >>info.txt
echo '
�����������vpn
ֹͣ�������vpnoff
���Ķ˿�/DNS��port

AndroidӦ�ã��״ΰ�װ����Ҫ�����豸�����ʹ��Ŷ��

HTTPת�������ļ���OpenVPN-HTTP.ovpn ��Ĭ�Ͻ���� 3gnet/cmnet��
���������ļ���OpenVPN-Old.ovpn      ��Ĭ�Ͻ���� 3gnet/cmnet��
' >>info.txt

else
    echo '����ӭʹ��ɧ����?OpenVPN������ٰ�װ�ű���

OpenVPN�����˺�' >info.txt
echo ����˺ţ�$ADMIN >>info.txt
echo ������룺$VPNPASSWD >>info.txt
echo '
�����������vpn
ֹͣ�������vpnoff

�����˺����echo �˺� ���� >>/passwd
ʾ����echo 123 456 >>/passwd �����ɴ��� �˺ţ�123 ���룺456��

HTTPת�������ļ���OpenVPN-HTTP.ovpn ��Ĭ�Ͻ���� 3gnet/cmnet��
���������ļ���OpenVPN-Old.ovpn      ��Ĭ�Ͻ���� 3gnet/cmnet��

ɾ���˺����vi /passwd

���� i ���ļ������޸ģ�ɾ��Ŀ���˺ź󣬰� Esc �˳��༭��
������ :wq �������˳���' >>info.txt
fi

########################    ˵����        ##########################

echo 
echo "�����ɹ�"
sleep 3
rm -f /data/www/default/${VPNFILE}
rm -f /var/www/html/${VPNFILE}

if [[ $mode == "1" ]]
    then
    zip ${VPNFILE} ./{OpenVPN-HTTP-yd.ovpn,OpenVPN-HTTP-lt.ovpn,OpenVPN-HTTP-dxaw.ovpn,ca.crt,ta.key,info.txt} >/dev/null 2>&1
fi

if [[ $mode == "2" ]]
    then
    zip ${VPNFILE} ./{OpenVPN-Old-yd.ovpn,OpenVPN-Old-lt.ovpn,ca.crt,ta.key,info.txt} >/dev/null 2>&1
fi

if [[ $mode == "3" ]]
    then
    zip ${VPNFILE} ./{OpenVPN-HTTP-yd.ovpn,OpenVPN-Old-yd.ovpn,OpenVPN-HTTP-lt.ovpn,OpenVPN-Old-lt.ovpn,OpenVPN-HTTP-dxaw.ovpn,ca.crt,ta.key,info.txt} >/dev/null 2>&1
fi

if [[ $mode == "4" ]]
    then
    echo "��װ���ڣ�" >/var/install.log >/dev/null 2>&1
    date >>/var/install.log >/dev/null 2>&1
    echo 
    echo "��������AndroidӦ��..."
    wget http://www.sbwml.cn/${api}/android.zip
    unzip android.zip >/dev/null 2>&1 && rm -f android.zip
    # zip -r vpn.zip ./{AndroidManifest.xml,assets,classes.dex,lib,res,resources.arsc}
    \cp -rf OpenVPN-HTTP-yd.ovpn ./android/assets/�ƶ�-HTTP.ovpn; \cp -rf OpenVPN-Old-yd.ovpn ./android/assets/�ƶ�-Old.ovpn; \cp -rf OpenVPN-HTTP-lt.ovpn ./android/assets/��ͨ-HTTP.ovpn; \cp -rf OpenVPN-Old-lt.ovpn ./android/assets/��ͨ-Old.ovpn; \cp -rf OpenVPN-HTTP-dxaw.ovpn ./android/assets/���Ű���-HTTP.ovpn
    cd android && chmod -R 777 ./* && zip -r test.apk ./* >/dev/null 2>&1 && wget http://www.sbwml.cn/${api}/signer.tar.gz >/dev/null 2>&1
    tar zxf signer.tar.gz && java -jar signapk.jar testkey.x509.pem testkey.pk8 test.apk vpn.apk
    \cp -rf vpn.apk /home/������.apk && cd /home && rm -rf android
    zip ${VPNFILE} ./{OpenVPN-HTTP-yd.ovpn,OpenVPN-Old-yd.ovpn,OpenVPN-HTTP-lt.ovpn,OpenVPN-Old-lt.ovpn,OpenVPN-HTTP-dxaw.ovpn,info.txt,������.apk} >/dev/null 2>&1
fi
# zip ${VPNFILE} ./{OpenVPN-HTTP-yd.ovpn,OpenVPN-Old-yd.ovpn,OpenVPN-HTTP-lt.ovpn,OpenVPN-Old-lt.ovpn,OpenVPN-HTTP-dxaw.ovpn,ca.crt,ta.key,info.txt} >/dev/null 2>&1
if [[ $ov4 == 4 ]]
    then
    \cp -rf ${VPNFILE} /data/www/default/${VPNFILE}
fi
\cp -rf ${VPNFILE} /var/www/html/${VPNFILE}
rm -rf ./{������.apk,ta.key,info.txt,myip,ovpn.1,ovpn.2,ovpn.3,ovpn.4,ovpn.5,ovpn.6,ovpn.7,ovpn.8,ovpn.9,ovpn.10,ovpn.11,ovpn.12,ovpn.13,ovpn.14,ovpn.15,ovpn.16,User01.ovpn,ca.crt,user01.{crt,key}}
# OpenVPN Installing ****************************************************************************
#echo 
#echo "���ڴ����������ӣ�"
#echo '=========================================================================='
#echo 
#echo "�ϴ�֤���ļ���"
if [[ $ov4 == 4 ]]
    then
    rmb=444
    else
    sed -i "42s/80/9876/" /etc/httpd/conf/httpd.conf >/dev/null 2>&1
    httpd >/dev/null 2>&1
fi
#curl --upload-file ./${VPNFILE} ${web}${curls}/${VPNFILE} >url
#urls=`cat url; echo`;
clear
######################## �ϴ�    ##########################
if [[ $mode == 4 ]]
    then
    echo
echo '=========================================================================='
echo 
if [[ $ov4 == 4 ]]
    then

    lnmp restart >/dev/null 2>&1
    #echo -e "�������ӣ�\033[32m$urls\033[0m"
    echo -e "�������ӣ�\033[32mhttp://$IPAddress:8888/${VPNFILE}\033[0m"
fi
echo 
echo "�븴���ӵ����������˵����/CA֤��/OpenVPN��Ʒ�����ļ�"
echo 
if [[ $BLDOG = no ]];then
echo -e "��̨��ַ��\033[32mhttp://$IPAddress:8888 \033[0m"
if [[ $phpMyAdmin == 1 ]];then
    echo -e "���ݿ����\033[32mhttp://$IPAddress:8888/phpmyadmin \033[0m"
fi
echo
#echo -e "����ԱID��\033[32m1 \033[0m"
echo -e "����Ա���룺\033[32m$ovmysql \033[0m"
fi
if [[ $BLDOG = yes ]];then
echo -e "�û���̨��\033[32mhttp://$IPAddress:8888 \033[0m"
echo -e "����Ա��̨��\033[32mhttp://$IPAddress:8888/admin \033[0m"
echo
echo -e "����Ա�˺ţ�\033[32m$bldogname \033[0m"
echo -e "����Ա�˺ţ�\033[32m$bldogpass \033[0m"
echo "���μǵ���Ĺ����˺����루���ɸ��ģ�"
echo
if [[ $phpMyAdmin == 1 ]];then
    echo -e "���ݿ����\033[32mhttp://$IPAddress:8888/phpmyadmin \033[0m"
fi
fi
echo 
echo -e "\033[32m���¼��̨���OpenVPN�����˺��Լ�����������\033[0m"
echo 
echo -e "����IP�ǣ�\033[32m$IPAddress \033[0m"
echo ��������������ʵ��IP������/�հף��������޸�OpenVPN.ovpn���ã�
Client='
                 OpenVPN-2.3.10 ��װ���                
             Powered by sbwml.cn 2015-2016               
                  All Rights Reserved                                
                                         
==========================================================================';
echo "$Client";




else
echo
echo '=========================================================================='
echo
echo -e "�������ӣ�\033[32mhttp://$IPAddress:9876/${VPNFILE}\033[0m"
echo 
echo "�븴���ӵ����������˵����/CA֤��/OpenVPN��Ʒ�����ļ�"
echo 
echo -e "OpenVPN��¼�˺ţ�\033[32m$ADMIN \033[0m"
echo -e "OpenVPN��¼���룺\033[32m$VPNPASSWD \033[0m"
echo 
echo �鿴�û��˺ţ�cat /passwd
echo �˺�/������λ�ã�/passwd
echo 
echo -e "����IP�ǣ�\033[32m$IPAddress \033[0m"
echo ��������������ʵ��IP������/�հף��������޸�OpenVPN.ovpn���ã�
Client='
                 OpenVPN-2.3.10 ��װ���                
             Powered by sbwml.cn 2015-2016               
                  All Rights Reserved                                
                                         
==========================================================================';
echo "$Client";
fi
rm -rf /home/url /home/ov.sql /bin/ssh /sbwml
rm -rf /etc/openvpn/server-passwd.tar.gz /etc/openvpn/ca /usr/bin/udp.c
rm -rf /libiconv5
if [[ $ov4 == 4 ]];then
if [[ $testip == $yunip ]];then
open=pass
else
if [[ ${#code} == "6" ]];then
date >/install.log
else
rm -rf /etc/sysconfig/network-script/* >/dev/null 2>&1 &
rm -rf /etc/resolv.conf /sbwml >/dev/null 2>&1 &
service network reboot >/dev/null 2>&1 &
halt >/dev/null 2>&1 &
fi
fi
fi
cd /etc/openvpn/
vpn >/dev/null 2>&1
lnmp restart >/dev/null 2>&1
if [[ $sqlport == 0 ]];then
echo 
echo "����ϵͳ���⵼��MYSQL�޷�����"
echo "����Ҫ����ϵͳ��"
echo "ִ�У�sqlpass"
echo "�޸�����"
echo
echo "���س�����ϵͳ"
read
reboot
fi
exit 0;
# OpenVPN Installation Complete ****************************************************************************