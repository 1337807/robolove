# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'robolove/version'

Gem::Specification.new do |spec|
  spec.name          = "Robolove"
  spec.version       = Robolove::VERSION
  spec.authors       = ["Jonan Scheffler"]
  spec.email         = ["jonanscheffler@gmail.com"]
  spec.summary       = %q{A simple library to control LegoNXT robots.}
  spec.description   = %q{Robolove wraps the lego_nxt gem to make driving easier.}
  spec.homepage      = "https://github.com/1337807/robolove"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.4.3"
  spec.add_development_dependency "pry", "~> 0.10.1"
end
