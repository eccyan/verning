# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'verning/version'

Gem::Specification.new do |spec|
  spec.name          = "verning"
  spec.version       = Verning::VERSION
  spec.authors       = ["eccyan"]
  spec.email         = ["g00.eccyan@gmail.com"]
  spec.description   = %q{versioning for methods, modules or classes}
  spec.summary       = %q{versioning helper}
  spec.homepage      = "https://github.com/eccyan/verning"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 0.9"
  spec.add_development_dependency "pry", "~> 0.9"
  spec.add_development_dependency "pry-debugger", "~> 0.2"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "activesupport", "~> 4.0"
end
