module PricingRules::Rules
  class Base
    attr_reader :item, :options
    def initialize(item, **options)
      @item = item
      @options = options
    end
    
    def total
      item_count * item_price
    end
  
    private
  
    def item_count
      item.count
    end
  
    def item_price
      item.price
    end
  end
end
