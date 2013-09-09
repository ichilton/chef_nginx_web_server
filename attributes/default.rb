#
# Cookbook Name:: nginx-web-server
# Attributes:: default
#

case node['platform_family']
  when 'debian'
    default['nginx-web-server']['repository_url'] = "http://nginx.org/packages/#{node['platform']}"
end
