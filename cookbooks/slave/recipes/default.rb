#
# Cookbook Name:: slave
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

package "sqlite-dev" do
  package_name value_for_platform(
    %w[centos redhat suse fedora] => { "default" => "sqlite-devel" },
    "default" => "libsqlite3-dev"
  )
end

package "redis-server"