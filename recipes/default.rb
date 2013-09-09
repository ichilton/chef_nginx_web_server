#
# Cookbook Name:: nginx-web-server
# Recipe:: default
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

directory node[:nginx_web_server][:config_dir] do
  owner 'root'
  group 'root'
  mode 00755
  recursive true
end

directory node[:nginx_web_server][:log_dir] do
  owner 'root'
  group 'root'
  mode 00755
  recursive true
end

%w(conf.d sites-available sites-enabled).each do |dir|
  directory File.join(node[:nginx_web_server][:config_dir], dir) do
    owner 'root'
    group 'root'
    mode 00755
  end
end
 
file "#{node[:nginx_web_server][:config_dir]}/conf.d/default.conf" do
  action :delete
end

file "#{node[:nginx_web_server][:config_dir]}/conf.d/example_ssl.conf" do
  action :delete
end

directory node[:nginx_web_server][:default_site][:root_dir] do
  owner 'root'
  group 'root'
  mode 00755
  recursive true
end

file "#{node[:nginx_web_server][:default_site][:root_dir]}/index.html" do
  owner 'root'
  group 'root'
  mode 00644
end

# Stop service:
service 'nginx' do
  provider Chef::Provider::Service::Init::Debian
  action :stop
  only_if Dir.glob('/etc/rc2.d/S??nginx').count > 0
end

# Disable service (disabling with chef creates /etc/rcX.d/K20nginx links):
execute 'disable-nginx' do
  command "update-rc.d -f nginx remove"
  only_if Dir.glob('/etc/rc2.d/S??nginx').count > 0
end

#service 'nginx' do
#  provider Chef::Provider::Service::Upstart
#  supports :restart => true, :start => true, :stop => true
#end

#template "nginx-upstart.conf" do
#  path "/etc/init/nginx.conf"
#  source "nginx-upstart.conf.erb"
#  owner "root"
#  group "root"
#  mode "0644"
#  notifies :restart, resources(:service => "nginx")
#end


