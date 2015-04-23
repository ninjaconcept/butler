# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'butler/version'

Gem::Specification.new do |spec|
  spec.name          = "butler"
  spec.version       = Butler::VERSION
  spec.authors       = ['Mohamed Wael Khobalatte', 'Stefan Botzenhart']
  spec.email         = ['wael.khobalatte@gmail.com', 'sb@ninjaconcept.com']
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "sass", [">= 3.2.0", "< 3.5"]
  spec.add_dependency "bootstrap-sass", '~> 3.3.3'
  spec.add_dependency "haml-rails", '~> 0.8'
  spec.add_dependency "jquery-rails", '~> 4.0.3'
  spec.add_dependency "jquery-ui-rails", '~> 5.0.3'
  spec.add_dependency "jquery-fileupload-rails", '~> 0.4.4'
  spec.add_dependency 'momentjs-rails', '>= 2.9.0'
  spec.add_dependency 'bootstrap3-datetimepicker-rails', '~> 4.7.14'
  spec.add_dependency 'font-awesome-rails', '~> 4.3.0'
  spec.add_dependency 'bourbon', '~> 3.2.4'
  spec.add_dependency 'cocoon', '~> 1.2.6'
  spec.add_dependency 'simple_form', '~> 3.1.0'
  spec.add_dependency 'kaminari', '~> 0.16.3'
  spec.add_dependency 'rails-i18n', '~> 4.0.4'
  # spec.add_dependency 'x-editable-rails' #, '~> 1.5.3'

end
