
Ticketbis dev stack powered with Vagrant and Ansbile
====================================================

Install
-------

* Install Virtualbox
* Install Vagrant
* Install Ansible (Python needed)
* Clone this repository

Configuration
-------------

The first thing is to select an IP where we could access to the VM. In this example we will use: `192.168.100.44`

### Configure in `Vagrantfile` the VM IP:

    config.vm.network :private_network, ip: "192.168.100.44"

### Configure IPs in `hosts-vagrant` matching the `Vagrantfile` IP:

    [main]
    192.168.100.44

    [databases]
    192.168.100.44

    [vagrant]
    192.168.100.44

Run vagrant
-----------

    vagrant up

After this we coudl use `vagrant ssh` to enter the provisioned VM