#!/bin/sh

ssh alpha "cd istepaniuk-com; git pull && git submodule init && git submodule update && jekyll b"
