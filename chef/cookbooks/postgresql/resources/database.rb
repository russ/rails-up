actions :create_db

attribute :host, :kind_of => String
attribute :port, :default => 5432
attribute :username, :kind_of => String
attribute :password, :kind_of => String
attribute :database, :kind_of => String
attribute :database_user, :kind_of => String
attribute :database_password, :kind_of => String
attribute :exists, :default => false
