# Try ignoring the failure...

# apt_update 'update' do
#     action :update
#     ignore_failure true
# end

####Do This
# execute 'apt update && apt upgrade -y'
####Then Reboot!!!

# The key here seems to be getting ALL of the updates applied

# package "git" do
#   action :upgrade
# end

# https://linoxide.com/linux-how-to/how-install-gui-ubuntu-server-guide/
# package "ubuntu-gnome-desktop" do
#     ignore_failure true
# end

####Then Do This
package "gnome-session" do
    timeout 6000
end
package "ubuntu-desktop" do
    timeout 6000
end
package "ubuntu-gnome-desktop"

execute 'apt update && apt upgrade -y'

execute 'systemctl isolate graphical.target'

# Need to add a reboot to the base image?