#
# Cookbook Name:: nginx_web_server
# Recipe:: config
#

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

template 'nginx.conf' do
  path "#{node[:nginx_web_server][:config_dir]}/nginx.conf"
  source 'nginx.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, resources(:service => 'nginx')
end

%w(conf.d sites-available sites-enabled).each do |dir|
  directory File.join(node[:nginx_web_server][:config_dir], dir) do
    owner 'root'
    group 'root'
    mode 00755
  end
end

template 'default_site' do
  path "#{node[:nginx_web_server][:config_dir]}/sites-available/default_site"
  source 'default_site.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, resources(:service => 'nginx')
end

link "#{node[:nginx_web_server][:config_dir]}/sites-enabled/default_site" do
  to "#{node[:nginx_web_server][:config_dir]}/sites-available/default_site"
end

file "#{node[:nginx_web_server][:config_dir]}/conf.d/default.conf" do
  action :delete
  notifies :restart, resources(:service => 'nginx')
end

file "#{node[:nginx_web_server][:config_dir]}/conf.d/example_ssl.conf" do
  action :delete
  notifies :restart, resources(:service => 'nginx')
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
