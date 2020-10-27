#!/bin/bash

set -e

chmod 777 /srv/jekyll
git submodule init
git submodule update
jekyll build --future
apk add tidyhtml

find _site -name "*.html" -exec tidy -config _tidy_config.txt {} \;

exit 0
