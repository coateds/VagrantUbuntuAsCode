# Upgrade to Git unnecessary
# package "git" do
#   action :upgrade
# end

# To install VSCode:
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF
# sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
# sudo apt -y install code

execute "setup MS VSCocde repo" do
  command <<-EOF
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF
    add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  EOF
  not_if 'ls /etc/apt/sources.list.d | grep vscode'
end

package 'code'

# Adds to sources.list:
  # deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main
  # # deb-src [arch=amd64] https://packages.microsoft.com/repos/vscode stable main
# creates sources.list.d/vscode.list
  # ### THIS FILE IS AUTOMATICALLY CONFIGURED ###
  # # You may comment out this entry, but any other modifications may be lost.
  # deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main
# creates a trusted.gpg file (not text)
# creates a trusted.gpg.d/microsoft.gpg file (not text)




# Or
# `snap install vscode`

# Or
# Try the apt_repository resource: https://docs.chef.io/resource_apt_repository.html

# apt_repository 'vscode' do
#     uri 'https://packages.microsoft.com/repos/vscode'
#     arch 'amd64'
#     components ['stable main']
#     # keyserver 'keyserver.ubuntu.com'
#     # key 'EB3E94ADBE1229CF'
#     deb_src false
#     # action :add
# end

# apt_repository 'nginx' do
#   uri        'http://nginx.org/packages/ubuntu/'
#   components ['nginx']
# end

# apt_repository 'juju' do
#     uri 'http://ppa.launchpad.net/juju/stable/ubuntu'
#     components ['main']
#     distribution 'trusty'
#     key 'C8068B11'
#     keyserver 'keyserver.ubuntu.com'
#     action :add
#     deb_src true
#   end



# if node['devops-apps']['myattr'].to_s == 'y'
#     directory "myattr"
# end