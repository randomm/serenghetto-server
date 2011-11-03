require 'rbconfig'
#HOST_OS = Config::CONFIG['host_os']
source 'http://rubygems.org'
gem 'rails', '3.1.1'
#gem 'sqlite3'
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end
gem 'jquery-rails'
#if HOST_OS =~ /linux/i
#  gem 'therubyracer', '>= 0.8.2'
#end
gem "haml", ">= 3.1.2"
gem "haml-rails", ">= 0.3.4", :group => :development
gem "rspec-rails", ">= 2.6.1", :group => [:development, :test]
gem "factory_girl_rails", ">= 1.2.0", :group => [:development, :test]
gem "cucumber-rails", ">= 1.0.2", :group => :test
gem "capybara", ">= 1.1.1", :group => :test
gem "database_cleaner", ">= 0.6.7", :group => :test
gem "launchy", ">= 2.0.5", :group => :test
gem "guard", ">= 0.6.2", :group => :development
gem "ruby-debug19", :group => [:development, :test], :require => "ruby-debug"
gem 'rb-fsevent', :group => :development
gem 'growl', :group => :development
gem "guard-bundler", ">= 0.1.3", :group => :development
gem "guard-rails", ">= 0.0.3", :group => :development
gem "guard-livereload", ">= 0.3.0", :group => :development
gem "guard-rspec", ">= 0.4.3", :group => :development
gem "guard-cucumber", ">= 0.6.1", :group => :development
gem "devise", ">= 1.4.5"
gem "frontend-helpers"
gem "rails-footnotes", ">= 3.7", :group => :development

# add mysql
#gem "mysql", ">= 2.8.1"

# add postgresql
gem 'pg', :require => 'pg'

# add spatial adapter
#gem 'spatial_adapter', :git => 'git://github.com/randomm/spatial_adapter.git'

# add rgeo
gem 'rgeo'
gem 'rgeo-geojson'
gem 'activerecord-postgis-adapter', :require => 'activerecord-postgis-adapter'

# add acts_as_api for easy json responses
gem 'acts_as_api', :git => 'git://github.com/randomm/acts_as_api.git'

# add cancan
gem "cancan", ">=1.6.6"

# add cucumber-api-steps and jsonpath for API acceptance testing
#gem 'cucumber-api-steps', :group => :test, :require => false # does not seem to work; page not available in tests
gem 'jsonpath', :group => :test

# install heroku gem
gem "heroku"