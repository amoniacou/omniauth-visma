# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-visma/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "omniauth-visma"
  spec.version       = OmniAuth::Visma::VERSION
  spec.authors       = ["Espen Antonsen", "Amoniac OU"]
  spec.email         = ["espen@inspired.no", "oleksandr@amoniac.eu"]
  spec.description   = %q{OmniAuth strategy for Visma eAccounting.}
  spec.summary       = %q{OmniAuth strategy for Visma eAccounting.}
  spec.homepage      = "https://github.com/amoniacou/omniauth-visma"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', ">= 1.7"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "webmock"
end
