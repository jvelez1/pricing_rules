require "pricing_rules/rules/base"
require "pricing_rules/rules/discount_bulk_on_price_percentage"
require 'pricing_rules/rules/discount_bulk_on_price_value'
require 'pricing_rules/rules/buy_and_get'
require 'pricing_rules/item'
require 'pricing_rules/rule'
require 'pricing_rules/product'
require 'pricing_rules/rule_parser'
require "pricing_rules/version"

module PricingRules
  class Error < StandardError; end
  # Your code goes here...

  p pricing_rules = Rule.all
  p Product.all
end
