# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'css_class_string/version'

Gem::Specification.new do |spec|
  spec.name          = "css-class-string"
  spec.version       = CssClassString::VERSION
  spec.authors       = ["Dmitriy Rozhkov"]
  spec.email         = ["rojkov.dmitry@gmail.com"]
  spec.description   = %q{Helper for creating css class strings inspired by ReactJS classSet}
  spec.summary       = %q{}
  spec.homepage      = "https://github.com/nLight/css-class-string"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
end
