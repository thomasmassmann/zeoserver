#
# Cookbook Name:: zeoserver
# Recipe:: commons
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

# Python is required.
include_recipe "python::default"

# Install rsync
package "rsync"

service "zeoserver" do
  provider Chef::Provider::Service::Init::Debian
  supports :restart => true, :start => true, :stop => true
end

user node[:zeoserver][:user] do
  shell "/bin/sh"
  home node[:zeoserver][:dir]
  system true
  action :create
end

directory node[:zeoserver][:dir] do
  mode "0755"
  owner node[:zeoserver][:user]
  recursive true
  action :create
end

directory node[:zeoserver][:dir_log] do
  mode "0755"
  owner node[:zeoserver][:user]
  recursive true
  action :create
end

directory node[:zeoserver][:dir_var] do
  mode "0755"
  owner node[:zeoserver][:user]
  recursive true
  action :create
end

directory node[:zeoserver][:dir_backups] do
  mode "0755"
  owner node[:zeoserver][:user]
  recursive true
  action :create
end

directory node[:zeoserver][:dir_filestorage] do
  mode "0755"
  owner node[:zeoserver][:user]
  recursive true
  action :create
end

directory node[:zeoserver][:dir_blobstorage] do
  mode "0755"
  owner node[:zeoserver][:user]
  recursive true
  action :create
end
