#
# Cookbook Name:: nginx-web-server
# Attributes:: default
#

case node[:platform_family]
  when 'debian'
    default[:nginx_web_server][:repository_url] = "http://nginx.org/packages/#{node[:platform]}"
end

default[:nginx_web_server][:config_dir] = '/etc/nginx'
default[:nginx_web_server][:log_dir] = '/var/log/nginx'

default[:nginx_web_server][:default_site][:enabled] = true
default[:nginx_web_server][:default_site][:root_dir] = '/usr/share/nginx/html'
