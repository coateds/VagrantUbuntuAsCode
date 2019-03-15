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
  end

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "gui"
  end
end