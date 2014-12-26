#!/bin/sh

ssh alpha "cd istepaniuk-com; git pull && git submodule init && git submodule update && jekyll b && find /var/www/blog -name \"*.html\" -exec tidy -wrap 100 -utf8 -i -m {} \\;"
