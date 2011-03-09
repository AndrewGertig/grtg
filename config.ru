root_dir = File.dirname(__FILE__)
app_file = File.join(root_dir, 'shortener.rb')
addto_path = File.expand_path(File.join(File.dirname(__FILE__), 'vendor', 'gems', 'environment'))
require app_file
require addto_path

# This actually requires the bundled gems
Bundler.require_env

set :environment, ENV['RACK_ENV'].to_sym
set :root,        root_dir
set :app_file,    app_file
disable :run

run Sinatra::Application