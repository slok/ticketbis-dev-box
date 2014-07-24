# -*- mode: ruby -*-
# vi: set ft=ruby :

######################### EDIT AFTER THIS LINE #################################
projects_folder = "/home/slok/projects"

###################### DO NOT EDIT AFTER THIS LINE #############################

VAGRANTFILE_API_VERSION = "2"
ENV['VAGRANT_DEFAULT_PROVIDER'] ||= 'docker'
#IMPORTANT!! RUN VAGRANT LIKE THIS:
# vagrant up --no-parallel

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.ssh.port = "22" # small fix for https://github.com/mitchellh/vagrant/issues/3799

  # Mysql data container
  config.vm.define "mysql-data" do |v|
    v.vm.provider "docker" do |d|
      d.name = "devbox-mysql-data"
      d.image = "slok/mysql-data"
      d.has_ssh = false
      d.remains_running = false
    end
  end

  # Mysql container
  config.vm.define "mysql" do |v|
    v.vm.provider "docker" do |d|
      d.name = "devbox-mysql"
      d.image = "slok/mysql"
      d.has_ssh = false
      d.create_args = ["--volumes-from=devbox-mysql-data"]
    end
  end

  # App container
  config.vm.define "devbox" do |v|
    v.vm.provider "docker" do |d|
      d.name = "devbox"
      d.image = "slok/tbdevbox:1.1"
      d.has_ssh = true
      d.link("devbox-mysql:db")
      d.ports = ["8080:8080", "8443:8443"]
      #d.volumes = ["/home/slok/projects:/home/vagrant/projects"]
    end
    v.vm.synced_folder projects_folder, "/home/vagrant/projects"
  end
end
