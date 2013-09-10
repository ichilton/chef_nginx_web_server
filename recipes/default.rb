#
# Cookbook Name:: nginx_web_server
# Recipe:: default
#

include_recipe 'nginx_web_server::install'
include_recipe 'nginx_web_server::upstart'
include_recipe 'nginx_web_server::config'
