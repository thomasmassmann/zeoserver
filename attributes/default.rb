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

# Generall attributes
default[:zeoserver][:user]                = "zope"
default[:zeoserver][:dir]                 = "/srv/zeoserver"
default[:zeoserver][:log_dir]             = "/var/log/zeoserver"
default[:zeoserver][:var_dir]             = "/srv/zeoserver/var"
default[:zeoserver][:install_method]      = 'buildout'

default[:zeoserver][:socket_name]         = "zeo.zdsock"
default[:zeoserver][:pid]                 = "/var/run/zeoserver.pid"

default[:zeoserver][:zeo_address]         = "127.0.0.1:8100"
default[:zeoserver][:effective_user]      = "zope"
