# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "nginx-web-server-berkshelf"
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :private_network, ip: "10.200.200.202"
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.run_list = [ "recipe[nginx_web_server::default]" ]
  end
end

