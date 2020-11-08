module PricingRules
  class BuyAndGet < Rule
    def total
      grouped.flat_map { |g| g.take(buy) }.sum
    end
  
    private
  
    def grouped
      values
        .each_slice(size_options)
        .to_a
    end
  
    def values
      Array.new(item_count, item_price)
    end
  
    def size_options
      raise 'INVALID CONFIGURATION' if get > buy
  
      buy + get
    end
  
    def get
      options[:get].to_i
    end
  
    def buy
      options[:buy].to_i
    end
  end
end
