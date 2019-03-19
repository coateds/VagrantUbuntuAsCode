execute 'log header' do
    command <<-EOF
      echo '*********'  >> #{node['log-file']['path']}
      echo 'Gui recipe' >> #{node['log-file']['path']}
      echo ''  >> #{node['log-file']['path']}
    EOF
  end

package "gnome-session" do
    timeout 6000
end

package "ubuntu-desktop" do
    timeout 6000
end

package "ubuntu-gnome-desktop"

execute 'apt update && apt upgrade -y'
execute 'systemctl isolate graphical.target'