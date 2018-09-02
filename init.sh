#!/bin/bash
echo 'Checking Linux distro...'

function check_distro {
if cat /proc/version | grep -i $1 > /dev/null ; then 
	os=$1
fi
}

check_distro ubuntu
check_distro centos
check_distro redhat
check_distro debian

if [ $os ] ; then
	echo "Found $os release"
else
	echo 'Could not identify Linux release !!!'
	exit 1
fi

if [ "$os" == "centos" ] || [ "$os" == "redhat" ] ; then
	echo "installing required packages"
	if ! res=$(yum list installed | grep -i "virtualbox" ) ; then 
		echo "VirtualBox was not found, installing..."
		cd /etc/yum.repos.d/
		wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo > /dev/null
		yum -y install VirtualBox-5.2 > /dev/null
		if [ $? -ne 0 ] ; then
			echo "Install was not successful! Aborting..."
			exit 1
		else
		echo "Install complete..."
		fi
	else
		echo "VirtualBox already installed"
	fi
	if ! res=$(yum list installed | grep -i "vagrant" ) ; then
		echo "Vagrant was not found, installing..."
		yum -y install https://releases.hashicorp.com/vagrant/2.1.4/vagrant_2.1.4_x86_64.rpm > /dev/null
		mkdir ~/vagrant-home
                if [ $? -ne 0 ] ; then
                        echo "Install was not successful! Aborting..."
                        exit 1
                else
                echo "Install complete..."
                fi

	else
                echo "Vagrant already installed"
	fi
        if ! res=$(yum list installed | grep -i "ansible" ) ; then
                echo "Ansible was not found, installing..."
                yum -y install ansible > /dev/null
                if [ $? -ne 0 ] ; then
                        echo "Install was not successful! Aborting..."
                        exit 1
                else
                echo "Install complete..."
                fi

        else
                echo "ansible already installed"
        fi

if [ "$os" == "ubuntu" ] || [ "$os" == "debian" ] ; then
	echo "Ubuntu/debian support will be added later..."
fi

vagrant plugin install vagrant-hostsupdater
