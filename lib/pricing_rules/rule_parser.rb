module PricingRules
  class RuleParser
    def self.parse(item, rule_conf)
      rule_name = rule_conf[:name]
      options = rule_conf[:options]&.transform_keys(&:to_sym)
      if rule_name
        if Object.const_defined?("PricingRules::Rules::#{rule_name}")
          klass = Object.const_get("PricingRules::Rules::#{rule_name}")
        end
      end
      
      klass ? klass.new(item, **options) : Rules::Base.new(item, **{})
    end
  end
end
