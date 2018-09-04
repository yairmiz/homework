# Ldap Server and Cilent provisioning.
This git repo contains the following:
  * Vagrant config file
  * ansible roles for provisiong an OpenLDAP server and a client VMs (Ubuntu Distro).
  * init.sh script that will setup the vagrant host with requiered virtualbox and vagrant packages (Compaitble only with Centos 7 for now)


Vagrant will provision two VM's with private network addresses:
 * ldap - 192.168.2.100
 * client - 192.168.2.101


Installtion instructions:
 1. clone git repository 'git clone https://github.com/yairmiz/homework'
 2. run the provided init.sh script
 3. run 'vagrant up'
 4. after provision completes run 'vagrant ssh client'
 5. test ldap user with 'su - ldapuser' password is 123456
