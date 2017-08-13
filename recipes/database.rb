#
# Cookbook Name:: wordpress
# Recipe:: database
#

mysql_client 'default' do
  version '5.7'
  action :create
end

db = node['wordpress']['db']

::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
::Chef::Recipe.send(:include, Wordpress::Helpers)

if is_local_host? db['host']

  mysql_service db['instance_name'] do
    port db['port']
    version db['mysql_version']
    initial_root_password db['root_password']
    action [:create, :start]
  end

  template 'my.conf' do
    path   '/etc/my.cnf.d/my.conf'
    source 'my.conf.erb'
    owner  'root'
    group  'root'
  end

  template 'create-wp-database.sql' do
    path   '/usr/local/src/create-wp-database.sql'
    source 'create-wp-database.sql.erb'
    owner  'root'
    group  'root'
  end

  template 'create-wp-user.sql' do
    path   '/usr/local/src/create-wp-user.sql'
    source 'create-wp-user.sql.erb'
    owner  'root'
    group  'root'
  end

  template 'exists-wp-user.sql' do
    path   '/usr/local/src/exists-wp-user.sql'
    source 'exists-wp-user.sql.erb'
    owner  'root'
    group  'root'
  end

  bash 'create wp database' do
    cwd     '/usr/local/src'
    code    'mysql --defaults-extra-file=/etc/my.cnf.d/my.conf < create-wp-database.sql'
    not_if  "mysql --defaults-extra-file=/etc/my.cnf.d/my.conf -e 'show databases;' | grep #{node['wordpress']['dir']}"
  end

  bash 'create wp user' do
    cwd     '/usr/local/src'
    code    'mysql --defaults-extra-file=/etc/my.cnf.d/my.conf < create-wp-user.sql'
    not_if  "mysql --defaults-extra-file=/etc/my.cnf.d/my.conf < exists-wp-user.sql | grep #{node['wordpress']['user']}"
  end

end
