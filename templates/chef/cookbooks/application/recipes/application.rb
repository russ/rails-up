template "/etc/init.d/application" do
  source "application.init.erb"
  mode 0755
  backup false
end

bash "Bundling the application" do
  user "application"
  cwd "/vagrant"
  code "rvm exec bundle --deployment"
end

service "application" do
  supports :start => true, :stop => true, :restart => true
  action [ :enable, :start ]
  subscribes :restart, resources(:template => "/etc/init.d/application")
end
