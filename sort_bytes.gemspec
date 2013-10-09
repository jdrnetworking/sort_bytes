# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sort_bytes/version'

Gem::Specification.new do |spec|
  spec.name          = "sort_bytes"
  spec.version       = SortBytes::VERSION
  spec.authors       = ["Jon Riddle"]
  spec.email         = ["jon@jdrnetworking.com"]
  spec.description   = %q{Sorts lines by human-readable byte size (like the output of `du -h`)}
  spec.summary       = %q{Sorts lines by human-readable byte size}
  spec.homepage      = "https://github.com/jdrnetworking/sort_bytes"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.4"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
