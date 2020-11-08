
[![Ruby 2.7.1](https://img.shields.io/badge/ruby-2.7.1-blue.svg)](https://www.ruby-lang.org/es/news/2020/03/31/ruby-2-7-1-released/) ![Travis](https://api.travis-ci.com/jvelez1/pricing_rules.svg?branch=main)

A Simple function that adds products to a 'cart' and displays the total price applying some dynamic pricing rules for discounts.

## Installation

Execute:

  $ bundle install

Or install it yourself as:

  $ gem install pricing_rules

## Required

There are necessary 2 files:

* products.json:

```JSON
[
  {
    "name": "Green tea",
    "code": "GR1",
    "price": 3.11
  },
  {
    "name": "Strawberries",
    "code": "SR1",
    "price": 5
  },
  {
    "name": "Coffe",
    "code": "CF1",
    "price": 11.23
  }
]

```

* rules_config.json

```JSON
[
  {
    "on":"GR1",
    "rule":{
      "class":"BuyAndGet",
      "options":{
          "buy":1,
          "get":1
        }
     }
  },
  {
    "on":"SR1",
    "rule":{
      "class":"DiscountBulkOnPriceValue",
      "options":{
          "validation":"greater_than_or_equal_to",
          "quantity":3,
          "forced_price":4.5
        }
     }
  },
  {
    "on":"CF1",
    "rule":{
      "class":"DiscountBulkOnPricePercentage",
      "options":{
          "validation":"greater_than_or_equal_to",
          "percentage":0.6667,
          "quantity":3
        }
     }
  }
]

```


## Usage

**Note:**
To use in development run: `bin/console`

```ruby
# Initialize all rules (STEP REQUIRED)
pricing_rules = PricingRules::Rule.all

# Initialize the Checkout with the rules
checkout = PricingRules::Checkout.new(pricing_rules)

# Scan all the elements
checkout.scan('GR1')
checkout.scan('SR1')
checkout.scan('GR1')
checkout.scan('GR1')
checkout.scan('CF1')

# Finally ask for the total
checkout.total
```

## Test data
```Json
Basket: GR1,SR1,GR1,GR1,CF1
Total price expected: ​ 22.45

Basket: GR1,GR1
Total price expected: ​ 3.11

Basket: SR1,SR1,GR1,SR1
Total price expected:​ 16.61

Basket: GR1,CF1,SR1,CF1,CF1
Total price expected:​ 30.57
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
