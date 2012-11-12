maintainer        "Inqbus"
maintainer_email  "thomas.massmann@inqbus.de"
license           "apache2"
description       "Installs and configures a Zope ZEO-Server."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1.0"

depends           "python"


recipe "zeoserver::buildout", "Installs a ZEO-Server via buildout."
