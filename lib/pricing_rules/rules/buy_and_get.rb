module PricingRules::Rules
  class BuyAndGet < Base
    def total
      # Only sum the quiantity I want to buy.
      # for buy 1 and get 1 free:
      # [[4.5, 4.5], [4.5]] => I'm going to take just 1 for each array, and sum the value 
      grouped.flat_map { |g| g.take(buy) }.sum
    end
  
    private
  
    def grouped
      # [[4.5, 4.5], [4.5]] if size_options = 2
      values
        .each_slice(size_options)
        .to_a
    end
  
    def values
      # [4.5, 4.5, 4.5] if quantity = 3 and price = 4.5
      Array.new(item_quantity, item_price)
    end
  
    def size_options
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
