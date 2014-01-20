# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "raring64"

  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.network :forwarded_port, guest: 8080, host: 18080
  config.vm.network :forwarded_port, guest: 8090, host: 18090
  config.vm.network :forwarded_port, guest: 3306, host: 13306
  config.vm.network :forwarded_port, guest: 6379, host: 16379

  #config.vm.network :public_network
  config.vm.network :private_network, ip: "192.168.100.44"

  config.vm.synced_folder "~/projects/ticketbis", "/vagrant_data"

  config.vm.provider :virtualbox do |vb|
     vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "main.yml"
    ansible.inventory_path = "hosts-vagrant"
    ansible.verbose = "v"
  end
end
