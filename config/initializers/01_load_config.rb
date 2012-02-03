# These needed to load the config.yml
require 'yaml'
require 'ostruct'

# Read the config from the config.yml # THIS SHOULD BE DONE IN load_config.yml, but for some reason APP_CONFIG is not usable here
APP_CONFIG = OpenStruct.new(YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env].symbolize_keys)