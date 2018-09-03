Vagrant.configure("2") do |config|
 config.vm.provision "ansible_local" do |ansible|
     ansible.become = true
     ansible.verbose = "v"
     ansible.playbook = "ldap-provision.yaml"
    end
 config.vm.define "ldap" do |ldap|
    ldap.vm.box = "ubuntu/trusty64"
    ldap.vm.hostname = 'ldap'
    ldap.vm.box_url = "ubuntu/trusty64"

    ldap.vm.network :private_network, ip: "192.168.2.100"
    ldap.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "ldap"]
      v.customize ["modifyvm", :id, "--cableconnected1", "on"]
    end
  end

  config.vm.define "client" do |client|
    client.vm.box = "ubuntu/trusty64"
    client.vm.hostname = 'client'
    client.vm.box_url = "ubuntu/trusty64"

    client.vm.network :private_network, ip: "192.168.2.101"

    client.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "client"]
      v.customize ["modifyvm", :id, "--cableconnected1", "on"]
    end
  end
end
