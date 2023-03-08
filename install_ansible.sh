cd /vagrant/pkgs/rpm_cache

rpm -ivh python-deltarpm-3.6-3.el7.x86_64.rpm
rpm -ivh createrepo-0.9.9-28.el7.noarch.rpm

createrepo /vagrant/pkgs/rpm_cache

rpm -ivh apr-1.4.8-5.el7.x86_64.rpm
rpm -ivh apr-util-1.5.2-6.el7.x86_64.rpm
rpm -ivh httpd-tools-2.4.6-90.el7.centos.x86_64.rpm
rpm -ivh centos-logos-70.0.6-3.el7.centos.noarch.rpm
rpm -ivh mailcap-2.1.41-2.el7.noarch.rpm
rpm -ivh httpd-2.4.6-90.el7.centos.x86_64.rpm

chown -R apache.apache /vagrant/pkgs/rpm_cache

sed -i 's/DocumentRoot \"\/var\/www\/html\"/DocumentRoot \"\/vagrant\/pkgs\/rpm_cache\"/' /etc/httpd/conf/httpd.conf
sed -i 's/Directory \"\/var\/www\/html\"/Directory \"\/vagrant\/pkgs\/rpm_cache\"/' /etc/httpd/conf/httpd.conf

rm -rf /etc/httpd/conf.d/welcome.conf

systemctl stop firewalld
setenforce 0

systemctl start httpd

rpm -ivh yum-plugin-priorities-1.1.31-52.el7.noarch.rpm

rpm -ivh python2-pyasn1-0.1.9-7.el7.noarch.rpm
rpm -ivh python-ipaddress-1.0.16-2.el7.noarch.rpm
rpm -ivh python-six-1.9.0-2.el7.noarch.rpm
rpm -ivh python-httplib2-0.9.2-1.el7.noarch.rpm
rpm -ivh sshpass-1.06-2.el7.x86_64.rpm
rpm -ivh libyaml-0.1.4-11.el7_0.x86_64.rpm
rpm -ivh PyYAML-3.10-11.el7.x86_64.rpm
rpm -ivh python-backports-1.0-8.el7.x86_64.rpm
rpm -ivh python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch.rpm
rpm -ivh python-setuptools-0.9.8-7.el7.noarch.rpm
rpm -ivh python-babel-0.9.6-8.el7.noarch.rpm
rpm -ivh python-passlib-1.6.5-2.el7.noarch.rpm
rpm -ivh python-ply-3.4-11.el7.noarch.rpm
rpm -ivh python-pycparser-2.14-1.el7.noarch.rpm
rpm -ivh python-cffi-1.6.0-5.el7.x86_64.rpm
rpm -ivh python-markupsafe-0.11-10.el7.x86_64.rpm
rpm -ivh python-jinja2-2.7.2-4.el7.noarch.rpm
rpm -ivh python-idna-2.4-1.el7.noarch.rpm
rpm -ivh python-enum34-1.0.4-1.el7.noarch.rpm
rpm -ivh python2-cryptography-1.7.2-2.el7.x86_64.rpm
rpm -ivh python-paramiko-2.1.1-9.el7.noarch.rpm
rpm -ivh python2-jmespath-0.9.0-3.el7.noarch.rpm
rpm -ivh ansible-2.4.2.0-2.el7.noarch.rpm

sed -i 's/#host_key_checking = False/host_key_checking = False/' /etc/ansible/ansible.cfg

PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ansible-playbook --limit="all" --inventory-file=/vagrant/inventory -v /vagrant/playbooks/cdh_cm.yml
