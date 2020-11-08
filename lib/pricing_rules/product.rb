require 'json'

module PricingRules
  class Product < Struct.new(:code, :name, :price)
    def self.all
      return @all if defined? @all

      file = File.open('product.json')
      content = file.read
      file.close
      @all ||= JSON.parse(content).map do |data|
        new(
          data['code'],
          data['name'],
          data['price']
        )
      end
    end
  end
end
