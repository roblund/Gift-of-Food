# This file is used by Rack-based servers to start the application.


ENV['GEM_HOME']="/home/roblund/gof.theredhoodie.com/vendor/bundle/ruby/1.8"
ENV['GEM_PATH']="#{ENV['GEM_HOME']}:/usr/lib/ruby/gems/1.8"
require 'rubygems'

require ::File.expand_path('../config/environment',  __FILE__)
Gem.clear_paths

run Giftoffood::Application
