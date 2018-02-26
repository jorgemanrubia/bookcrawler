# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bookcrawler/version'

Gem::Specification.new do |spec|
  spec.name          = "bookcrawler"
  spec.version       = Bookcrawler::VERSION
  spec.authors       = ["Jorge Manrubia"]
  spec.email         = ["jorge.manrubia@gmail.com"]

  spec.summary       = %q{Fetch books metadata using Amazon Product Advertising API}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/jorgemanrubia/bookcrawler"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  spec.add_dependency "vcr", "~> 2.9.3"
  spec.add_dependency "vacuum", "~> 1.3.0"
  spec.add_dependency "webmock", "~> 1.19.0"

  spec.add_development_dependency "typhoeus"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "awesome_print"
end
