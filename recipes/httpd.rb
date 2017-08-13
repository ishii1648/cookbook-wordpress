#
# Cookbook Name:: wordpress
# Recipe:: httpd
#



httpd_service 'default' do
  mpm 'prefork'
  action [:create, :start]
end

httpd_module 'rewrite' do
  action :create
end

httpd_module 'php' do
  action :create
end

httpd_config 'default' do
  source 'wordpress.conf.erb'
  notifies :restart, 'httpd_service[default]'
  action :create
end
