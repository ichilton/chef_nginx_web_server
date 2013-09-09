name             'nginx_web_server'
maintainer       'Ian Chilton'
maintainer_email 'ian@ichilton.co.uk'
license          'All rights reserved'
description      'Installs/Configures the Nginx Web Server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu'

depends 'apt'
