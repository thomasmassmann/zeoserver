maintainer        "Inqbus"
maintainer_email  "thomas.massmann@inqbus.de"
license           "apache2"
description       "Installs and configures a Zope ZEO-Server."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1.1"

depends           "python"


recipe "zeoserver", "Installs a ZEO-Server based on the chosen install method. Registers and starts a service. Installs cron jobs."
recipe "zeoserver::buildout", "Installs a ZEO-Server via buildout."
recipe "zeoserver::pip", "Installs a ZEO-Server via pip."


# General Attributes.
attribute "zeoserver/user",
  :display_name => "Zope User",
  :description => "User the Zope ZEO-Server will run as.",
  :default => "zope"

attribute "zeoserver/dir",
  :display_name => "ZEO-Server Directory",
  :description => "Location for the ZEO-Server installation.",
  :default => "/srv/zeoserver"

attribute "zeoserver/dir_log",
  :display_name => "Log Directory",
  :description => "Location for the log files.",
  :default => "/var/log/zeoserver"

attribute "zeoserver/dir_var",
  :display_name => "Var Directory",
  :description => "Used to configure the base directory for all things going into var.",
  :default => "/srv/zeoserver/var"

attribute "zeoserver/dir_filestorage",
  :display_name => "Database Directory",
  :description => "Directory for database files.",
  :default => "/srv/zeoserver/var/filestorage"

attribute "zeoserver/dir_blobstorage",
  :display_name => "BLOB Directory",
  :description => "Directory for blob files.",
  :default => "/srv/zeoserver/var/blobstorage"

attribute "zeoserver/install_method",
  :display_name => "Installation Method",
  :description => "How the ZEO-Server should be installed.",
  :default => "buildout"


# Process related attributes
attribute "zeoserver/zeo_address",
  :display_name => "zeo_address",
  :description => "Give a port for the ZEO server (either specify the port number only (with '127.0.0.1' as default) or you use the format host:port).",
  :default => "127.0.0.1:8100"

attribute "zeoserver/monitor_address",
  :display_name => "monitor_address",
  :description => "The address at which the monitor server should listen. The monitor server provides server statistics in a simple text format.",
  :default => "127.0.0.1:8200"

attribute "zeoserver/effective_user",
  :display_name => "effective_user",
  :description => "The name of the effective user for the ZEO process. This causes the process to run under the user account the process has been started with.",
  :default => "zope"

attribute "zeoserver/socket_name",
  :display_name => "socket_name",
  :description => "The filename where ZEO will write its socket file. Defaults to zeo.zdsock.",
  :default => "zeo.zdsock"


# Packing related attributes
attribute "zeoserver/do_pack",
  :display_name => "Enable Database Packing",
  :description => "Enable weekly scheduled packing of the ZODB.",
  :default => "true"

attribute "zeoserver/pack_days",
  :display_name => "pack_days",
  :description => "How many days of history should the zeopack script retain.",
  :default => "1"

attribute "zeoserver/pack_gc",
  :display_name => "pack_gc",
  :description => "Can be set to false to disable garbage collection as part of the pack.",
  :default => "true"

attribute "zeoserver/pack_keep_old",
  :display_name => "pack_keep_old",
  :description => "Can be set to false to disable the creation of *.fs.old files before the pack is run.",
  :default => "true"

attribute "zeoserver/pack_user",
  :display_name => "pack_user",
  :description => "If the ZEO server uses authentication, this is the username used by the zeopack script to connect to the ZEO server.",
  :default => nil

attribute "zeoserver/pack_password",
  :display_name => "pack_password",
  :description => "If the ZEO server uses authentication, this is the password used by the zeopack script to connect to the ZEO server.",
  :default => nil

attribute "zeoserver/pack_minute",
  :display_name => "pack_minute",
  :description => "Minute at which the pack should be done. Only in combination with 'do_pack'.",
  :default => "5"

attribute "zeoserver/pack_hour",
  :display_name => "pack_hour",
  :description => "Hour at which the pack should be done. Only in combination with 'do_pack'.",
  :default => "0"

attribute "zeoserver/pack_weekday",
  :display_name => "pack_weekday",
  :description => "Weekday at which the pack should be done. Only in combination with 'do_pack'.",
  :default => "0"


# Backup related attributes
attribute "zeoserver/do_backup",
  :display_name => "Enable Backup",
  :description => "Enable daily scheduled backups.",
  :default => "true"

attribute "zeoserver/dir_backups",
  :display_name => "Backups Directory",
  :description => "Directory for database and blob backups.",
  :default => "/srv/zeoserver/var/backups"

attribute "zeoserver/backup_minute",
  :display_name => "backup_minute",
  :description => "Minute at which the backup should be done. Only in combination with 'do_backup'.",
  :default => "5"

attribute "zeoserver/backup_hour",
  :display_name => "backup_hour",
  :description => "Hour at which the backup should be done. Only in combination with 'do_backup'.",
  :default => "1"


# Buildout related attributes
attribute "zeoserver/virtualenv",
  :display_name => "Virtualenv Directory",
  :description => "Directory for the virtualenv. Only used for buildout.",
  :default => "/srv/zeoserver/venv"
