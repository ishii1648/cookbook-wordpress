#
# Cookbook Name:: wordpress
# Attributes:: wordpress
#

default['wordpress']['version'] = 'latest'

default['wordpress']['db']['root_password'] = 'my_root_password'
default['wordpress']['db']['instance_name'] = 'default'
default['wordpress']['db']['name'] = "wordpressdb"
default['wordpress']['db']['user'] = "wordpressuser"
default['wordpress']['db']['pass'] = nil
default['wordpress']['db']['prefix'] = 'wp_'
default['wordpress']['db']['host'] = 'localhost'
default['wordpress']['db']['port'] = '3306'  # Must be a string
default['wordpress']['db']['charset'] = 'utf8'
default['wordpress']['db']['collate'] = ''
default['wordpress']['db']['mysql_version'] = '5.7'

default['wordpress']['install']['user'] = 'apache'
default['wordpress']['install']['group'] = 'apache'

default['wordpress']['server_name'] = 'localhost'
default['wordpress']['parent_dir'] = '/usr/local'
default['wordpress']['dir'] = "#{node['wordpress']['parent_dir']}/wordpress"
default['wordpress']['url'] = "https://wordpress.org/wordpress-#{node['wordpress']['version']}.tar.gz"

default['wordpress']['languages']['lang'] = ''
default['wordpress']['languages']['version'] = ''
default['wordpress']['languages']['repourl'] = 'http://translate.wordpress.org/projects/wp'
default['wordpress']['languages']['projects'] = ['main', 'admin', 'admin_network', 'continents_cities']
default['wordpress']['languages']['themes'] = []
default['wordpress']['languages']['project_pathes'] = {
  'main'              => '/',
  'admin'             => '/admin/',
  'admin_network'     => '/admin/network/',
  'continents_cities' => '/cc/'
}

default['wordpress']['config_perms'] = 0644
default['wordpress']['server_port'] = '80'

default['wordpress']['wp_config_options'] = {}

default['wordpress']['php_options'] = { 'php_admin_value[upload_max_filesize]' => '50M', 'php_admin_value[post_max_size]' => '55M' }
