# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    #Salt master
    config.vm.define "master" do |master|
        master.vm.box = "hashicorp/precise64"
        #master.vm.synced_folder "project/", "/project"
        master.vm.synced_folder "srv/", "/srv"
        master.vm.network "private_network", ip: "192.168.44.10"

        master.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "1024"]
            #vb.gui = true
        end

        master.vm.provision :salt do |salt|
            salt.install_master = true
            # Config Options
            salt.master_config = "salt/master"
            salt.master_key = "salt/key/master.pem"
            salt.master_pub = "salt/key/master.pub"
        end
    end

    #Minion1 - 64 bit Ubuntu
    config.vm.define "dev-ubuntu-1" do |dev-ubuntu-1|
        dev-ubuntu-1.vm.box = "hashicorp/precise64"
        dev-ubuntu-1.vm.network "public_network"

        #project/ will be where you will have to checkout your project into
        dev-ubuntu-1.vm.synced_folder "project", "/project"
        dev-ubuntu-1.vm.provision :shell, path: "bootstrap-minion/minion-ubuntu.sh"

        dev-ubuntu-1.vm.provider do |vb|
            vb.customize ["modifyvm", :id, "--memory", "2048"]
        end

        #Set up as salt minion
        dev-ubuntu-1.vm.provision :salt do |salt|
            salt.no_minion = false
            salt.install_type  ="develop"
            salt.minion_config = "salt/minion"
            salt.minion_key = "salt/key/minion.pem"
            salt.minion_pub = "salt/key/minion.pub"
        end
    end

end
