require "pricing_rules/rule"
require "pricing_rules/discount_bulk_on_price_percentage"
require 'pricing_rules/discount_bulk_on_price_value'
require 'pricing_rules/buy_and_get'
require 'pricing_rules/item'
require 'pricing_rules/rule_parser'
require "pricing_rules/version"

module PricingRules
  class Error < StandardError; end
  # Your code goes here...

  rules = [
    {
      on: 'GR1',
      rule: {
        name: 'BuyAndGet',
        options: {
          buy: 1,
          get: 1
        }
      }
    },
    {
      on: 'SR1',
      rule: {
        name: 'DiscountBulkOnPriceValue',
        options: {
          validation: 'greater_than_or_equal_to',
          count: 3,
          forced_price: 4.5
        }
      }
    },
    {
      on: 'CF1',
      rule: {
        name: 'DiscountBulkOnPricePercentage',
        options: {
          validation: 'greater_than_or_equal_to',
          percentage: 0.6667,
          count: 3
        }
      }
    }
  ]
end
