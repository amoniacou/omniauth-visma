# frozen_string_literal: true

require File.expand_path('lib/omniauth-vismaeaccounting/version', __dir__)

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-vismaeaccounting'
  spec.version       = OmniAuth::Vismaeaccounting::VERSION
  spec.authors       = ['Espen Antonsen', 'Amoniac OU']
  spec.email         = ['espen@inspired.no', 'oleksandr@amoniac.eu']
  spec.description   = 'OmniAuth strategy for Visma eAccounting.'
  spec.summary       = 'OmniAuth strategy for Visma eAccounting.'
  spec.homepage      = 'https://github.com/amoniacou/omniauth-vismaeaccounting'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 3.3.0'

  spec.add_runtime_dependency 'omniauth-oauth2', '>= 1.7'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'
end
