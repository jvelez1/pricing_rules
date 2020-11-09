module PricingRules::Rules
  class DiscountBulkOnPricePercentage < Base
    def total
      validation = options[:validation]
  
      if respond_to?(validation, :include_private) 
        total = send(validation)
      end
  
      total || super
    end
  
    private
  
    def greater_than_or_equal_to
      if item_quantity >= options[:quantity] && options[:percentage]
        value = (method(:total).super_method.call * options[:percentage]).round(2)
      end
  
      value
    end
  end  
end
