#
# Cookbook Name:: zeoserver
# Attributes:: default
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

# General attributes
default[:zeoserver][:user]                    = "zope"
default[:zeoserver][:dir]                     = "/srv/zeoserver"
default[:zeoserver][:dir_log]                 = "/var/log/zeoserver"
default[:zeoserver][:dir_var]                 = "#{node[:zeoserver][:dir]}/var"
default[:zeoserver][:dir_filestorage]         = "#{node[:zeoserver][:dir_var]}/filestorage"
default[:zeoserver][:dir_blobstorage]         = "#{node[:zeoserver][:dir_var]}/blobstorage"
default[:zeoserver][:install_method]          = "buildout"

# Process related attributes
default[:zeoserver][:zeo_address]             = "127.0.0.1:8100"
default[:zeoserver][:monitor_address]         = "127.0.0.1:8200"
default[:zeoserver][:effective_user]          = node[:zeoserver][:user]
default[:zeoserver][:socket_name]             = "zeo.zdsock"

# Packing related attributes
default[:zeoserver][:do_pack]                 = true
default[:zeoserver][:pack_days]               = "1"
default[:zeoserver][:pack_gc]                 = true
default[:zeoserver][:pack_keep_old]           = true
default[:zeoserver][:pack_user]               = nil
default[:zeoserver][:pack_password]           = nil
default[:zeoserver][:pack_minute]             = "5"
default[:zeoserver][:pack_hour]               = "0"
default[:zeoserver][:pack_weekday]            = "0"

# Backup related attributes
default[:zeoserver][:do_backup]               = true
default[:zeoserver][:dir_backups]             = "#{node[:zeoserver][:dir_var]}/backups"
default[:zeoserver][:backup_minute]           = "5"
default[:zeoserver][:backup_hour]             = "1"

# Buildout related attributes
default[:zeoserver][:virtualenv]              = "#{node[:zeoserver][:dir]}/venv"
