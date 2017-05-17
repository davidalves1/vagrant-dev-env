# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"

  # config.ssh.username = 'ubuntu'
  # config.ssh.password = 'vagrant'
  config.ssh.insert_key = true

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. 
  config.vm.network "forwarded_port", guest: 80,    host: 8080 # http
  config.vm.network "forwarded_port", guest: 3306,  host: 33006 # mysql

  # Create a private network, which allows host-only access to the machine
  config.vm.network "private_network", ip: "192.168.30.100"

  # Share an additional folder to the guest VM.
  # config.vm.synced_folder "your/local/folder", "vm/respective/folder"
  config.vm.synced_folder 'html/', '/var/www/html/', :mount_options => ["dmode=777","fmode=666"], nfs: true
  config.vm.synced_folder 'home/', '/home/ubuntu/', nfs: true

  # Provider-specific configuration
  config.vm.provider "virtualbox" do |vb|
    # Don't boot with headless mode
    vb.gui = false

    # set the vm name in virtualbox
    vb.name = "vagrant-dev-env"

    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory",               "512"]
    # vb.customize ["modifyvm", :id, "--cpuexecutioncap",      "95"]
    # vb.customize ["modifyvm", :id, "--natdnshostresolver1",  "on"]
    # vb.customize ["modifyvm", :id, "--natdnsproxy1",         "on"]
  end

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  # install some base packages with Apache
  config.vm.provision :shell, path: "bootstrap-apache.sh"

  # install some base packages with Nginx
  # config.vm.provision :shell, privileged: false, path: "bootstrap-nginx.sh"
end