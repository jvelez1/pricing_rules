module PricingRules
  class DiscountBulkOnPriceValue < Rule
    def total
      validation = options[:validation]
      if respond_to?(validation, :include_private) 
        total = send(validation)
      end
  
      total ? total : super
    end
  
    private
  
    def greater_than_or_equal_to
      if item_count >= options[:count]
        return item_count * options[:forced_price]
      end
  
      nil
    end
  end
end
