module PricingRules::Rules
  class DiscountBulkOnPriceValue < Base
    def total
      validation = options[:validation]
      if respond_to?(validation, :include_private) 
        total = send(validation)
      end
  
      total || super
    end
  
    private
  
    def greater_than_or_equal_to
      if item_quantity >= options[:quantity]
        value = item_quantity * options[:forced_price]
      end
  
      value
    end
  end
end
