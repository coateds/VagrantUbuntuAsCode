Vagrant.configure("2") do |config|
  # Use this line to prevent (time consuming!) upgrade of Guest Additions
  # vbguest docs:  https://github.com/dotless-de/vagrant-vbguest
  # config.vbguest.auto_update = false
  
  # config.vm.box = "ubuntu/bionic64"
  config.vm.box = "Ubuntu1804Patched"
  config.vm.hostname = "UbuntuAsCode"
  # config.vm.hostname = "Ubuntu1804Patched"
  config.vm.network "private_network", type: "dhcp"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "UbuntuAsCode"
    vb.gui = true  # brings up the vm in gui window
    vb.memory = 4096
    vb.cpus = 4

    vb.customize ["modifyvm", :id, "--vram", "64"]  # vid RAM
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]

    # Add an extra disk and a DVD drive mounted with the Guest Additions
    file_to_disk = "ExtraDisk.vmdk"
    unless File.exist?(file_to_disk)
      vb.customize [ "createmedium", "disk", "--filename", file_to_disk, "--format", "vmdk", "--size",  256]
    end
    vb.customize [ "storageattach", :id, "--storagectl", "SCSI", "--port", 1, "--device", 0, "--type", "hdd", "--medium", file_to_disk ]
    
    # This is unneeded as I will not be mounting Guest Additions iso
    # vb.customize [ "storageattach", :id, "--storagectl", "SATA Controller", "--port", 2, "--device", 0, "--type", "dvddrive", "--medium", "C:\\Program Files\\Oracle\\VirtualBox\\VBoxGuestAdditions.iso"]
  end

  config.vm.provision "chef_zero" do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.data_bags_path = "data_bags"
    chef.nodes_path = "nodes"
    chef.roles_path = "roles"

    chef.add_recipe "partitions-filesystems"
    chef.add_recipe "tz"    
    chef.add_recipe "gui"
    chef.add_recipe "devops-apps"

    # Next refactor
    # chef.run_list = ["recipe[single-cook::default]"]
    # chef.add_recipe "single-cookbook::default"
    # chef.add_recipe "single-cookbook::notdefault"
  end
end