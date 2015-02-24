# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rake/camel/version'

Gem::Specification.new do |spec|
  spec.name          = "rake-camel"
  spec.version       = Rake::Camel::VERSION
  spec.authors       = ["mattak"]
  spec.email         = ["mattak.me@gmail.com"]
  spec.summary       = %q{A rake task name shortener with camelic case.}
  spec.description   = %q{A rake task name shortener with camelic case.}
  spec.homepage      = "https://github.com/mattak/rake-camel"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
