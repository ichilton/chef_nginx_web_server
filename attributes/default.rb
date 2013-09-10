#
# Cookbook Name:: nginx_web_server
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

default[:nginx_web_server][:worker_processes] = 1
default[:nginx_web_server][:worker_connections] = 1024
default[:nginx_web_server][:keepalive_timeout] = 15
