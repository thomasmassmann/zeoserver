#
# Cookbook Name:: zeoserver
# Recipe:: buildout
#
# Author:: Thomas Massmann (<thomas.massmann@inqbus.de>)
#
# Copyright 2012, Inqbus
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Install dependencies, prepare common directories.
include_recipe "zeoserver::commons"


directory "#{node[:zeoserver][:dir]}/downloads" do
  mode "0755"
  owner node[:zeoserver][:user]
  action :create
end

directory "#{node[:zeoserver][:dir]}/extends-cache" do
  mode "0755"
  owner node[:zeoserver][:user]
  action :create
end

python_virtualenv node[:zeoserver][:virtualenv] do
  owner node[:zeoserver][:user]
  action :create
end

cookbook_file "#{node[:zeoserver][:dir]}/bootstrap.py" do
  source "bootstrap.py"
  owner node[:zeoserver][:user]
  mode 0644
end

template "#{node[:zeoserver][:dir]}/buildout.cfg" do
  source "buildout.cfg.erb"
  owner node[:zeoserver][:user]
  mode 0644
  variables({
    :dir_filestorage => node[:zeoserver][:dir_filestorage],
    :dir_blobstorage => node[:zeoserver][:dir_blobstorage],
    :dir_backups => node[:zeoserver][:dir_backups],
    :dir_log => node[:zeoserver][:dir_log],
    :dir_var => node[:zeoserver][:dir_var],
    :zeo_address => node[:zeoserver][:zeo_address],
    :monitor_address => node[:zeoserver][:monitor_address],
    :effective_user => node[:zeoserver][:effective_user],
    :socket_name => node[:zeoserver][:socket_name],
    :pack_days => node[:zeoserver][:pack_days],
    :pack_gc => node[:zeoserver][:pack_gc],
    :pack_keep_old => node[:zeoserver][:pack_keep_old],
    :pack_user => node[:zeoserver][:pack_user],
    :pack_password => node[:zeoserver][:pack_password],
  })
  notifies :run, "execute[buildout]", :immediately
  notifies :restart, resources(:service => "zeoserver")
end

execute "buildout" do
  cwd node[:zeoserver][:dir]
  command "#{node[:zeoserver][:virtualenv]}/bin/python bootstrap.py && ./bin/buildout"
  user node[:zeoserver][:user]
  action :nothing
end

# Install and register services.
include_recipe "zeoserver::services"
