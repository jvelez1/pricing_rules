require "bundler/setup"
require "pricing_rules/rules/base"
require "pricing_rules/rules/discount_bulk_on_price_percentage"
require 'pricing_rules/rules/discount_bulk_on_price_value'
require 'pricing_rules/rules/buy_and_get'
require 'pricing_rules/item'
require 'pricing_rules/pricing_rule'
require 'pricing_rules/rule_parser'
require "pricing_rules/version"


RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
