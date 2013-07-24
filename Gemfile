source 'https://rubygems.org'

# Specify your gem's dependencies in decorate-responder.gemspec
gemspec

gem 'draper'
# draper requires activemodel
gem 'activemodel'

RAILS_VERSION = ENV['RAILS_VERSION'] || '4.0'

eval_gemfile File.expand_path("../gemfiles/Gemfile.rails-#{RAILS_VERSION.gsub(/\.+/, '-')}", __FILE__)
