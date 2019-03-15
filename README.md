# VagrantUbuntuAsCode-
Build out a Gui CentOS Vagrant/VirtualBox with Bash and Chef provisioning

This is an unstable process. The sequence for installing the Gnome Gui on the bionic64 vagrant image is:
* Patch the system
* Reboot
* Install the "ubuntu-gnome-desktop" package
* Patch the system
* Switch to (isolate) the graphical target
* Reboot

In order to eliminate the first reboot
* Package the patched, rebooted and updated Guest Additions installed base box with the name "Ubuntu1804Patched"
  * `vagrant package --output ubuntu1804patched`
  * `vagrant box add Ubuntu1804Patched ubuntu1804patched`
* In the Vagrantfile for the cloned box
  * `config.vm.box = "Ubuntu1804Patched"`
* ISSUE: This leaves the (large) image of the patched box in the folder with the Git repo. This file should not be copied up to GitHub
  * Soln 1: Add to gitignore
  * TRY LATER: determine if this file is needed or can be moved

I think there might be a timeout issue with large packages.
* Installing the "ubuntu-gnome-desktop" directly usually fails
* Installing the (only?) two dependency packages, "gnome-session" and "ubuntu-desktop" works more reliably?
  * Increase processors and memory - Did not work
  * Attempt to use a timeout on the package resources if the failures occur often enough
    * This seems to have worked

gui default.rb
```ruby
package "gnome-session" do
    timeout 6000
end
package "ubuntu-desktop" do
    timeout 6000
end
package "ubuntu-gnome-desktop"

execute 'apt update && apt upgrade -y'

execute 'systemctl isolate graphical.target'
```