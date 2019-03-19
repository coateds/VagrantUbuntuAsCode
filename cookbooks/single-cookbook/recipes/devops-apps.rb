execute 'log header' do
  command <<-EOF
    echo '*********'  >> #{node['log-file']['path']}
    echo 'devops applications recipe' >> #{node['log-file']['path']}
    echo ''  >> #{node['log-file']['path']}
  EOF
end

execute "setup MS VSCocde repo" do
  command <<-EOF
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF
    add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  EOF
  not_if 'ls /etc/apt/sources.list.d | grep vscode'
end

package 'code'

execute 'log partition 3' do
  command <<-EOF
    echo 'vscode not installed' >> #{node['log-file']['path']}
  EOF
  
  # This test does not work!!
  # look for apt list installed solution
  not_if 'apt list --installed | grep code/stable'
end