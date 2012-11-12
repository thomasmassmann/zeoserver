maintainer        "Inqbus"
maintainer_email  "thomas.massmann@inqbus.de"
license           "apache2"
description       "Installs and configures a Zope ZEO-Server."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1.0"

depends           "python"


recipe "zeoserver::buildout", "Installs a ZEO-Server via buildout."


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

attribute "zeoserver/dir_backups",
  :display_name => "Backups Directory",
  :description => "Directory for database and blob backups.",
  :default => "/srv/zeoserver/var/backups"

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


# Buildout related attributes
attribute "zeoserver/virtualenv",
  :display_name => "Virtualenv Directory",
  :description => "Directory for the virtualenv. Only used for buildout.",
  :default => "/srv/zeoserver/venv"
