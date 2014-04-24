# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #config.vm.box = "raring64"
  #config.vm.box_url = "https://dl.dropboxusercontent.com/u/547671/thinkstack-raring64.box"
  config.vm.box = "trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  
  config.vm.network :forwarded_port, guest: 8080, host: 8080
  config.vm.network :forwarded_port, guest: 8082, host: 8082
  config.vm.network :forwarded_port, guest: 8443, host: 8443
  config.vm.network :forwarded_port, guest: 8090, host: 8090

  # Mysql & redis put in different port
  config.vm.network :forwarded_port, guest: 3306, host: 13306
  config.vm.network :forwarded_port, guest: 6379, host: 16379
  config.vm.network :forwarded_port, guest: 6377, host: 16377

  #config.vm.network :public_network
  config.vm.network :private_network, ip: "192.168.100.44"

  config.vm.synced_folder "~/projects/ticketbis", "/home/vagrant/projects"

  config.vm.provider :virtualbox do |vb|
     vb.customize ["modifyvm", :id, "--memory", "3048"]
     vb.customize ["modifyvm", :id, "--cpus", "2"]
     vb.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "main.yml"
    ansible.inventory_path = "hosts-vagrant"
    ansible.verbose = "v"
    ansible.host_key_checking = false
    #ansible.extra_vars = { 
    #    tb_private_key: "/my/ssh/key" # Default ~/.ssh/id_rsa
    #}
  end

  # CAUTION: This is only for windows, if using, comment ansible block (previous)
  # NOTE: Copy ion this path the id_rsa file before proceding
  #
  # Used as base : https://github.com/KSid/windows-vagrant-ansible
  #config.vm.provision :shell do |sh|
  #  sh.privileged = false
  #  sh.path = "ansible-win-hack.sh"
  #  options = "tb_private_key=/vagrant/id_rsa something=xxx"
  #  sh.args = "/tmp/ansible main.yml hosts-vagrant #{options}"
  #end

end
