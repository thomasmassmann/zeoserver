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

General
-------

* `node[:zeoserver][:user]` - User the Zope ZEO-Server will run as.
* `node[:zeoserver][:dir]` - Location for the ZEO-Server installation.
* `node[:zeoserver][:dir_log]` - Location for the log files.
* `node[:zeoserver][:dir_var]` - Used to configure the base directory for all things going into var.
* `node[:zeoserver][:dir_backups]` - Directory for database and blob backups.
* `node[:zeoserver][:dir_filestorage]` - Directory for database files.
* `node[:zeoserver][:dir_blobstorage]` - Directory for blob files.
* `node[:zeoserver][:install_method]` - Method to install the ZEO-Server with, default `buildout`.

Buildout
--------

* `node[:zeoserver][:virtualenv]` - Directory for the virtualenv.


Usage
=====

Include the recipe on your node or role that fits how you wish to install the Zope ZEO-Server on your system per the recipes section above. Modify the attributes as required in your role to change how various configuration is applied per the attributes section above. In general, override attributes in the role should be used when changing attributes.

default
-------

Installs a Zope ZEO-Server by buildout, pip or package depending on the chosen install method.

buildout
--------

Installs a ZEO-Server via buildout.

pip
---

Installs a ZEO-Server via pip (coming soon).

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
