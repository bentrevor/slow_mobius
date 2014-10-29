# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slow_mobius/version'

Gem::Specification.new do |spec|
  spec.name          = 'slow_mobius'
  spec.version       = SlowMobius::VERSION
  spec.authors       = ['Ben Trevor']
  spec.email         = ['benjamin.trevor@gmail.com']
  spec.description   = 'Control system time from command line.'
  spec.summary       = 'Control system time from command line.'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'pry'
end
