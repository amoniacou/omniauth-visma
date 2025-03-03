# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path(__dir__)
$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'rspec'
require 'rack/test'
require 'omniauth'
require 'omniauth-vismaeaccounting'

Dir[File.expand_path('support/**/*', __dir__)].sort.each { |f| require f }

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.extend  OmniAuth::Test::StrategyMacros, type: :strategy
end
