# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doublesing/version'

Gem::Specification.new do |spec|
  spec.name          = "doublesing"
  spec.version       = Doublesing::VERSION
  spec.authors       = ["Anthony Super"]
  spec.email         = ["anthony@noided.media"]
  spec.summary       = %q{An extensible markup language}
  spec.homepage      = "http://www.github.com/AnthonySuper/Doublesing"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_runtime_dependency "sanitize-url"
  spec.add_runtime_dependency "sanitize"
  spec.add_runtime_dependency "parslet"
end
