require 'json'

module PricingRules
  class Product < Struct.new(:code, :name, :price)
    def self.all
      return @all if defined? @all

      raise 'No file found' unless File.exists?('products.json')
      content = File.read('products.json')
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
