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

template "zeoserver_init" do
  path "/etc/init.d/zeoserver"
  source "zeoserver_init.erb"
  owner "root"
  group "root"
  mode "0755"
  notifies :restart, resources(:service => "zeoserver")
end

service "zeoserver" do
  action [:enable, :start]
end

cron "zeoserver-backup" do
  minute node[:zeoserver][:backup_minute]
  hour node[:zeoserver][:backup_hour]
  command "#{node[:zeoserver][:dir]}/bin/backup -q"
  user node[:zeoserver][:user]
  if node[:zeoserver][:do_backup]
    action :create
  else
    action :delete
  end
end

cron "zeoserver-pack" do
  minute node[:zeoserver][:pack_minute]
  hour node[:zeoserver][:pack_hour]
  weekday node[:zeoserver][:pack_weekday]
  command "#{node[:zeoserver][:dir]}/bin/zeopack #{node[:zeoserver][:zeo_address]}"
  user node[:zeoserver][:user]
  if node[:zeoserver][:do_pack]
    action :create
  else
    action :delete
  end
end
