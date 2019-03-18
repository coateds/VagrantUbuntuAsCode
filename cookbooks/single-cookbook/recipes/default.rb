execute "append to log" do
    command <<-EOF
      echo 'start new' > #{node['log-file']['path']}
      date >> #{node['log-file']['path']}
      echo default.rb  >> #{node['log-file']['path']}
    EOF
  end

  # execute "append to log" do
  #   command <<-EOF
  #     echo 'start devops-apps' > #{node['log-file']['path']}
  #     date >> #{node['log-file']['path']}
  #     VAR='EnvVar'
  #     echo $VAR  >> /home/vagrant/provision.log
  #   EOF
  # end