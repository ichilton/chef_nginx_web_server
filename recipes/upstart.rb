#
# Cookbook Name:: nginx_web_server
# Recipe:: default
#

# Stop service managed by init:
service 'nginx' do
  provider Chef::Provider::Service::Init::Debian
  action :stop
  only_if { ::Dir.glob('/etc/rc2.d/S??nginx').count > 0 }
end

# Disable service (disabling with chef creates /etc/rcX.d/K20nginx links):
execute 'disable-nginx' do
  command "update-rc.d -f nginx remove"
  only_if { ::Dir.glob('/etc/rc2.d/S??nginx').count > 0 }
end

# Manage service with upstart:
service 'nginx' do
  provider Chef::Provider::Service::Upstart
  supports :restart => true, :start => true, :stop => true
end

template 'nginx-upstart.conf' do
  path '/etc/init/nginx.conf'
  source 'nginx-upstart.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, resources(:service => 'nginx')
end