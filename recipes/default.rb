#
# Cookbook Name:: wordpress
# Recipe:: default
#

include_recipe "yum-remi-chef::remi-php56"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "yum-mysql-community::mysql57"
include_recipe "wordpress::database"
include_recipe "wordpress::app"
include_recipe "wordpress::httpd"
