#
# Cookbook Name:: nginx_web_server
# Recipe:: install
#

# Add APT Repository:
case node['platform_family']
  when 'debian'
    include_recipe 'apt'

    apt_repository 'nginx' do
      uri node[:nginx_web_server][:repository_url]
      distribution node['lsb']['codename']
      components ['nginx']
      key 'http://nginx.org/keys/nginx_signing.key'
      action :add
    end
end

# Install Package:
package 'nginx'
