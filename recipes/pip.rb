#
# Cookbook Name:: zeoserver
# Recipe:: pip
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


python_virtualenv node[:zeoserver][:virtualenv] do
  owner node[:zeoserver][:user]
  action :create
end

cookbook_file "#{node[:zeoserver][:dir]}/requirements.txt" do
  source "requirements.txt"
  owner node[:zeoserver][:user]
  mode 0644
  notifies :run, "execute[requirements_update]", :immediately
end

execute "requirements_update" do
  cwd node[:zeoserver][:dir]
  command "#{node[:zeoserver][:virtualenv]}/bin/pip install -U -r #{node[:zeoserver][:dir]}/requirements.txt"
  user node[:zeoserver][:user]
  action :nothing
end

python_pip "requirements" do
  package_name "#{node[:zeoserver][:dir]}/requirements.txt"
  virtualenv node[:zeoserver][:virtualenv]
  options "-r"
  action :install
end

directory "#{node[:zeoserver][:dir]}/bin" do
  mode "0755"
  owner node[:zeoserver][:user]
  recursive true
  action :create
end

link "#{node[:zeoserver][:dir]}/bin/zeopack" do
  to "#{node[:zeoserver][:virtualenv]}/bin/zeopack"
  owner node[:zeoserver][:user]
end

template "zeoserver" do
  path "#{node[:zeoserver][:dir]}/bin/zeoserver"
  source "zeoserver.erb"
  owner node[:zeoserver][:user]
  mode "0755"
end

directory "#{node[:zeoserver][:dir]}/parts/zeoserver" do
  mode "0755"
  owner node[:zeoserver][:user]
  recursive true
  action :create
end

directory "#{node[:zeoserver][:dir]}/parts/zeoserver/bin" do
  mode "0755"
  owner node[:zeoserver][:user]
  recursive true
  action :create
end

directory "#{node[:zeoserver][:dir]}/parts/zeoserver/etc" do
  mode "0755"
  owner node[:zeoserver][:user]
  recursive true
  action :create
end

template "zeo.conf" do
  path "#{node[:zeoserver][:dir]}/parts/zeoserver/etc/zeo.conf"
  source "zeo.conf.erb"
  owner node[:zeoserver][:user]
  mode "0644"
  # notifies :restart, resources(:service => "zeoserver")
end

template "runzeo" do
  path "#{node[:zeoserver][:dir]}/parts/zeoserver/bin/runzeo"
  source "runzeo.erb"
  owner node[:zeoserver][:user]
  mode "0755"
end

link "#{node[:zeoserver][:dir]}/parts/zeoserver/bin/zeoctl" do
  to "#{node[:zeoserver][:virtualenv]}/bin/zeoctl"
  owner node[:zeoserver][:user]
end

%w{backups blobstoragebackups snapshotbackups blobstoragesnapshots}.each do |dir|
  directory "#{node[:zeoserver][:dir_backups]}/#{dir}" do
    mode "0755"
    owner node[:zeoserver][:user]
    recursive true
    action :create
  end
end

template "backup" do
  path "#{node[:zeoserver][:dir]}/bin/backup"
  source "backup.erb"
  owner node[:zeoserver][:user]
  mode "0755"
end

template "restore" do
  path "#{node[:zeoserver][:dir]}/bin/restore"
  source "restore.erb"
  owner node[:zeoserver][:user]
  mode "0755"
end

template "snapshotbackup" do
  path "#{node[:zeoserver][:dir]}/bin/snapshotbackup"
  source "snapshotbackup.erb"
  owner node[:zeoserver][:user]
  mode "0755"
end

template "snapshotrestore" do
  path "#{node[:zeoserver][:dir]}/bin/snapshotrestore"
  source "snapshotrestore.erb"
  owner node[:zeoserver][:user]
  mode "0755"
end

# Install and register services.
include_recipe "zeoserver::services"
