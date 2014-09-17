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
end
