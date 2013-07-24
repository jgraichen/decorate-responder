# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'decorate-responder/version'

Gem::Specification.new do |gem|
  gem.name          = "decorate-responder"
  gem.version       = DecorateResponder::VERSION
  gem.authors       = ["Jan Graichen"]
  gem.email         = ["jg@altimos.de"]
  gem.description   = %q{A Rails responder to decorate resources.}
  gem.summary       = %q{A Rails responder to decorate resources.}
  gem.homepage      = ""
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
