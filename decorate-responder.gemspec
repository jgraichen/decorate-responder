# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'decorate-responder/version'

Gem::Specification.new do |gem|
  gem.name          = 'decorate-responder'
  gem.version       = DecorateResponder::VERSION
  gem.authors       = ['Jan Graichen']
  gem.email         = ['jg@altimos.de']
  gem.description   = 'A Rails responder to decorate resources.'
  gem.summary       = 'A Rails responder to decorate resources.'
  gem.homepage      = ''
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'responders', '~> 2.0'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'minitest'
end
