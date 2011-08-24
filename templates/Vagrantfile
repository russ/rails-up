Vagrant::Config.run do |config|
  config.vm.box = "base"
  config.vm.network("33.33.33.10")
  config.vm.forward_port("web", 80, 5678)
  config.vm.customize do |vm|
    vm.name = "application"
    vm.memory_size = 768
  end

  # Share the WWW folder as the main folder for the web VM using NFS
  config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)
  config.vm.share_folder("cookbooks", "/var/chef", ".", :nfs => true)

  # Configure to provision with local cookbooks
  config.vm.provision :chef_solo do |chef|
    chef.json.merge!({
      :rvm => {
        :rubies => [ "ruby-1.9.2" ],
        :default_ruby => "ruby-1.9.2",
        :group_users => [ "vagrant", "application" ],
        :global_gems => [
          { :name => "bundler" }
        ],
        :rvmrc => {
          :rvm_gemset_create_on_use_flag => 1,
          :rvm_trust_rvmrcs_flag => 1
        }
      },
      :postgresql => {
        :server_root_password => "application",
      },
      :application => {
        :application_name => "application",
        :application_root => "/vagrant",
        :rails_env => "development"
      },
      :apps => {
        :application => {
          :database => {
            :name => "application",
            :username => "application",
            :password => "application",
          }
        }
      }
    })

    chef.roles_path = "chef/roles"
    chef.cookbooks_path = "chef/cookbooks"
    chef.add_role "base"
    chef.add_role "database"
    chef.add_role "redis"
    chef.add_role "application"
    chef.add_role "nginx"
  end
end
