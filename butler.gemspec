# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'butler/version'

Gem::Specification.new do |spec|
  spec.name          = "butler"
  spec.version       = Butler::VERSION
  spec.authors       = ["Mohamed Wael Khobalatte"]
  spec.email         = ["wael.khobalatte@gmail.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_dependency "sass", [">= 3.2.0", "< 3.5"]
  spec.add_dependency "bootstrap-sass"
  spec.add_dependency 'momentjs-rails', '>= 2.8.1'
  spec.add_dependency 'bootstrap3-datetimepicker-rails', '~> 3.1.3'
  spec.add_dependency 'recurring_select'
  spec.add_development_dependency "rake", "~> 10.0"
end
