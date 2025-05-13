#!/bin/bash

# make sure we have the latest version of ruby installed
ruby-install --update --cleanup --no-reinstall ruby

# configure bundler to install gems inside each directory
bundle config set --global path .bundle
