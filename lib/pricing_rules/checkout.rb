module PricingRules
  class Checkout
    attr_reader :items

    def initialize(pricing_rules)
      @pricing_rules = pricing_rules
      @items = []
    end

    def total
      items.sum { |item| item.total }
    end
    
    def scan(code)
      product = find_product(code)
      return unless product
  
      increase_or_initialize(product) 
    end
  
  
    private
    def increase_or_initialize(product)
      item = find_item(product.code)
      return item.increase! if item
  
      @items << Item.new(
        product.code,
        product.price,
        1,
        find_rule(product.code)
      )
    end

    def find_item(code)
      @items.find { |item| item.code == code }
    end

    def find_product(code)
      Product.all.find { |product| product.code == code }
    end

    def find_rule(code)
      @pricing_rules.find { |pricing_rule| pricing_rule.on == code}
    end
  end
end
