# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80,    host: 8080
  config.vm.network "forwarded_port", guest: 3306,  host: 3306

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "10.0.0.100"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  # config.vm.synced_folder('----localfolder-----', '/home/vagrant/code', :nfs => true)
  config.vm.synced_folder 'html/', '/var/html/', :mount_options => ["dmode=777","fmode=666"], nfs: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Don't boot with headless mode
    vb.gui = false

    vb.name = "vagrant-dev-env"

    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory",               "512"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap",      "95"]
    # vb.customize ["modifyvm", :id, "--natdnshostresolver1",  "on"]
    # vb.customize ["modifyvm", :id, "--natdnsproxy1",         "on"]
  end

  # config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  # install some base packages with Apache
  config.vm.provision :shell, path: "bootstrap-apache.sh"

  # install some base packages with Nginx
  # config.vm.provision :shell, path: "bootstrap-nginx.sh"
end