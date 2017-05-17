#vagrant-dev-env

Creates a standard development environment using Vagrant



## Prerequisites

- Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- Install [Vagrant](http://www.vagrantup.com/)
- Clone or [download](https://github.com/davidalves1/vagrant-dev-env/archive/master.zip) this repository to the root of your environment directory `git clone https://github.com/davidalves1/vagrant-dev-env.git`
- Go to your directory

## Using Apache
Just run `vagrant up` 

## Using Nginx
Open the `Vagrantfile` file, comment the command` config.vm.provision: shell, path: "bootstrap-apache.sh" `at line 53 and uncomment the` config.vm.provision: shell, path: "bootstrap- Nginx.sh "` at line 56