#!/bin/sh

ssh blog.istepaniuk.com "cd istepaniuk-com; git pull && git submodule init && git submodule update && jekyll build && find /var/www/blog -name \"*.html\" -exec tidy -config _tidy_config.txt {} \\;"
