# nginx_web_server cookbook

Had a number of problems with the Nginx cookbook so I broke the rule of re-use and whipped one up to do what I needed.

Installs Nginx on Ubuntu from packages, uses upstart and drops configuration in place.

Not ready for public consumption - needs config splitting out to attributes, documenting and tests adding.


# Requirements

The only dependancy is the 'apt' cookbook.


# Usage

Include the default recipe in your run list or wrapper cookbook.


# Attributes

See attributes/default.rb


# Recipes


# Author

Author:: Ian Chilton (<ian@ichilton.co.uk>)
