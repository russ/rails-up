node[:apps].each do |name, values|
  postgresql_database values[:database][:name] do
    host "localhost"
    port 5432
    username "postgres"
    password node[:postgresql][:server_root_password]
    database values[:database][:name]
    database_user values[:database][:username]
    database_password values[:database][:password]
    action :create_db
  end
end
