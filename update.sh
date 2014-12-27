#!/bin/sh

ssh alpha "cd istepaniuk-com; git pull && git submodule init && git submodule update && jekyll b && find /var/www/blog -name \"*.html\" -exec tidy -config _tidy_config.txt {} \\;"
