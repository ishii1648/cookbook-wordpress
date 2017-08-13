name             "wordpress"
maintainer       "Ishii Sho"
license          "BSD"
description      "Installs WordPress"
version          "1.0"

%w{ php openssl }.each do |cb|
  depends cb
end

depends "httpd", ">= 0.4.5"
depends "mysql", ">= 6.0"
#depends "mysql2_chef_gem", ">= 1.0.1"
#depends "database", ">= 1.6.0"
depends "tar", ">= 0.3.1"
depends "yum-remi-chef"
depends "yum-mysql-community"
