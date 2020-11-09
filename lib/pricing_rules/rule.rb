require 'json'

module PricingRules
  class Rule < Struct.new(:on, :rule)
    def self.all
      return @all if defined? @all

      raise 'No file found' unless File.exists?('rules_config.json')
      content = File.read('rules_config.json')
      @all ||= JSON.parse(content).map do |data|
        new(
          data['on'],
          class: data.dig('rule', 'class'),
          options: data.dig('rule', 'options')
        )
      end
    end
  end
end
