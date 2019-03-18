execute "append to log" do
  command <<-EOF
    echo notdefault.rb  >> #{node['log-file']['path']}
  EOF
end