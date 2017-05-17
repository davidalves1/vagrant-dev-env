# vagrant-dev-env

- Creates a standard development environment using Vagrant
- Runs on Ubuntu (Xenial 16.04 64 Bit) \w PHP 7.0 or 5.6, MySQL 5.7, Apache 2.3

## Prerequisites

- Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- Install [Vagrant](http://www.vagrantup.com/)
- Clone or [download](https://github.com/davidalves1/vagrant-dev-env/archive/master.zip) this repository to the root of your environment directory `git clone https://github.com/davidalves1/vagrant-dev-env.git`
- Go to your directory and run `$ mkdir html home`

## Using Apache
Just run `$ vagrant up` 

## Using Nginx
Open the `Vagrantfile` file, comment the command `config.vm.provision: shell, path: "bootstrap-apache.sh" `at line 53 and uncomment the `config.vm.provision: shell, path: "bootstrap-nginx.sh"` at line 56, save and run `$ vagrant up`
