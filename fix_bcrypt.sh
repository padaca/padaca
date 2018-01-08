#!/usr/bin/env bash

gem uninstall --force bcrypt
gem uninstall bcrypt-ruby
gem install bcrypt --platform=ruby
