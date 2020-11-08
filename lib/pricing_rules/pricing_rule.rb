require 'json'

module PricingRules
  class PricingRule < Struct.new(:on, :rule)
    def self.all
      return @all if defined? @all

      file = File.open('rule_config.json')
      content = file.read
      file.close
      @all ||= JSON.parse(content).map do |data|
        new(
          data['on'],
          name: data.dig('rule', 'name'),
          options: data.dig('rule', 'options')
        )
      end
    end
  end
end
