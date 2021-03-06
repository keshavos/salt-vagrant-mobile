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
            salt.master_config = "salt-configs/master"
            salt.master_key = "salt-configs/key/master.pem"
            salt.master_pub = "salt-configs/key/master.pub"
        end
    end

    #Minion1 - 64 bit Ubuntu
    config.vm.define "devubuntu1" do |devubuntu1|
        devubuntu1.vm.box = "drifty/ionic-android"
        devubuntu1.vm.network "public_network"

        #project/ will be where you will have to checkout your project into
        devubuntu1.vm.synced_folder "project", "/project"
        devubuntu1.vm.provision :shell, path: "bootstrap-minion/minion-ubuntu.sh"

        devubuntu1.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "2048"]
            vb.gui = "true"
            vb.customize ["usbfilter", "add", "0", "--target", :id, "--name", "android", "--vendorid", "0x18d1"]
        end

        #Set up as salt minion
        devubuntu1.vm.provision :salt do |salt|
            salt.no_minion = false
            salt.install_type  ="stable"
            salt.minion_config = "salt-configs/minion"
            salt.minion_key = "salt-configs/key/minion.pem"
            salt.minion_pub = "salt-configs/key/minion.pub"
        end
    end

    #Jenkins1 - 64 bit Ubuntu
    config.vm.define "jenkinsubuntu" do |jenkinsubuntu|

        jenkinsubuntu.vm.box = "hashicorp/precise64"
        jenkinsubuntu.vm.network "public_network"

        jenkinsubuntu.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "2048"]
            #vb.gui = true
        end

        #Set up as salt minion
        jenkinsubuntu.vm.provision :salt do |salt|
            salt.no_minion = false
            salt.install_type  ="stable"
            salt.minion_config = "salt-configs/minion"
            salt.minion_key = "salt-configs/key/minion.pem"
            salt.minion_pub = "salt-configs/key/minion.pub"
        end
    end


end
