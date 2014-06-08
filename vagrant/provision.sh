#
# iptables off
#
/sbin/iptables -F
/sbin/service iptables stop
/sbin/chkconfig iptables off

# basic tools
yum -y install glibc-common
yum -y install mlocate
yum -y groupinstall "Japanese Support"
yum -y install emacs

# PHP
yum -y install php

# PostgreSQL
yum -y install http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-redhat93-9.3-1.noarch.rpm
yum -y install postgresql93 postgresql93-server postgresql93-contrib postgresql93-libs
/sbin/service postgresql-9.3 initdb
/sbin/chkconfig postgresql-9.3 on
/sbin/service postgresql-9.3 start

# postgresql.conf の設定
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /var/lib/pgsql/9.3/data/postgresql.conf
sudo sed -i "s/#port = 5432/port = 5432/"                               /var/lib/pgsql/9.3/data/postgresql.conf
# pg_hba.conf の設定
echo 'host    all             all             0.0.0.0/0               trust' | sudo tee -a /var/lib/pgsql/9.3/data/pg_hba.conf
# 再起動
sudo /etc/rc.d/init.d/postgresql-9.3 restart

# Apache
yum -y install httpd
cp -a /vagrant/httpd.conf /etc/httpd/conf/
/sbin/service httpd restart
/sbin/chkconfig httpd on

# Install X Window System and GNOME
# yum -y groupinstall "X Window System" "Desktop"
