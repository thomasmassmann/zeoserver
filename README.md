Description
===========

This cookbook installs and configures a Zope ZEO-Server.

Requirements
============

Cookbooks
---------

- python


Attributes
==========

See `attributes/default.rb` for default values.

General attributes
------------------

* `node[:zeoserver][:user]` - User the Zope ZEO-Server will run as. Defaults
  to `zope`.
* `node[:zeoserver][:dir]` - Location for the ZEO-Server installation. Defaults
  to `/srv/zeoserver`.
* `node[:zeoserver][:dir_log]` - Location for the log files. Defaults to
  `/var/log/zeoserver`.
* `node[:zeoserver][:dir_var]` - Used to configure the base directory for all
  things going into var. Defaults to `/srv/zeoserver/var`.
* `node[:zeoserver][:dir_filestorage]` - Directory for database files. Defaults
  to `/srv/zeoserver/var/filestorage`.
* `node[:zeoserver][:dir_blobstorage]` - Directory for blob files. Defaults to
  `/srv/zeoserver/var/blobstorage`.
* `node[:zeoserver][:install_method]` - Method to install the ZEO-Server with.
  Defaults to `buildout`.

Process related attributes
--------------------------

* `node[:zeoserver][:zeo_address]` - The port for the ZEO server (either
  specify the port number only (with `127.0.0.1` as default) or you use the
  format `host:port`). Defaults to `127.0.0.1:8100`.
* `node[:zeoserver][:monitor_address]` - The address at which the monitor
  server should listen. The monitor server provides server statistics in a
  simple text format. Defaults to `127.0.0.1:8200`.
* `node[:zeoserver][:effective_user]` - The name of the effective user for the
  ZEO process. This causes the process to run under the user account the
  process has been started with. Defaults to the `node[:zeoserver][:user]`.
* `node[:zeoserver][:socket_name]` - The filename where ZEO will write its
  socket file. Defaults to `zeo.zdsock`.

Packing related attributes
--------------------------

* `node[:zeoserver][:do_pack]` - Enable weekly scheduled packing of the ZODB.
  Defaults to `true`.
* `node[:zeoserver][:pack_days]` - How many days of history should the zeopack
  script retain. Defaults to `1`.
* `node[:zeoserver][:pack_gc]` - Can be set to false to disable garbage
  collection as part of the pack. Defaults to `true`.
* `node[:zeoserver][:pack_keep_old]` - Can be set to false to disable the
  creation of *.fs.old files before the pack is run. Defaults to `true`.
* `node[:zeoserver][:pack_user]` - If the ZEO server uses authentication, this
  is the username used by the zeopack script to connect to the ZEO server. The
  default is no user.
* `node[:zeoserver][:pack_password]` - If the ZEO server uses authentication,
  this is the password used by the zeopack script to connect to the ZEO server.
  The default is no password.
* `node[:zeoserver][:pack_minute]` - Minute at which the pack should be done.
  Only in combination with `do_pack`. Defaults to `5`.
* `node[:zeoserver][:pack_hour]` - Hour at which the pack should be done. Only
  in combination with `do_pack`. Defaults to `0`.
* `node[:zeoserver][:pack_weekday]` - Weekday at which the pack should be done.
  Only in combination with `do_pack`. Defaults to `0` (sunday).

Backup related attributes
-------------------------

* `node[:zeoserver][:do_backup]` - Enable backup and do a daily one via cron.
  Defaults to `true`.
* `node[:zeoserver][:dir_backups]` - Directory for database and blob backups.
  Defaults to `/srv/zeoserver/var/backups`.
* `node[:zeoserver][:backup_minute]` - Minute at which the backup should be
  done. Only in combination with `do_backup`. Defaults to `5`.
* `node[:zeoserver][:backup_hour]` - Hour at which the backup should be done.
  Only in combination with `do_backup`. Defaults to `1`.

Buildout
--------

* `node[:zeoserver][:virtualenv]` - Directory for the virtualenv. Defaults to
  `/srv/zeoserver/venv`.


Usage
=====

Include the recipe on your node or role that fits how you wish to install the
Zope ZEO-Server on your system per the recipes section above. Modify the
attributes as required in your role to change how various configuration is
applied per the attributes section above. In general, override attributes in
the role should be used when changing attributes.

default
-------

Installs a Zope ZEO-Server by `buildout`, `pip` or `package` depending on the
chosen install method. The ZEO-Server is registered as a service and started
automatically.

Installs daily backups and weekly database packing via cron jobs (can be
disabled - see attributes).

buildout
--------

Installs a ZEO-Server via buildout.

pip
---

Installs a ZEO-Server via pip.

package
-------

Installs a ZEO-Server from packages (coming soon).


License and Author
==================

Author:: Thomas Massmann <thomas.massmann@inqbus.de>

Copyright:: 2012, Inqbus

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
