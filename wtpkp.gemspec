# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wtpkp/version'

Gem::Specification.new do |spec|
  spec.name          = "wtpkp"
  spec.version       = WTPKP::VERSION
  spec.authors       = ["Piotrek Dubiel"]
  spec.email         = ["piotr.dubiel@polidea.com"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.1"

  spec.files         = `git ls-files`.split($/)
  spec.executables   =  "wtpkp"
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "terminal-notifier", "~> 1.6.0"
  spec.add_dependency "terminal-table", "~> 1.4.5"
  spec.add_dependency "mechanize", "~> 2.7.3"
  spec.add_dependency "docopt", "~> 0.5.0"
  spec.add_dependency "tzinfo", "~> 1.2.2"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
end
