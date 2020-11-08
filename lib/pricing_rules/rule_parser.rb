module PricingRules
  class RuleParser
    def self.parse(item, conf = nil)
      rule_name = conf[:name] if conf
      if rule_name
        if Object.const_defined?("PricingRules::#{rule_name}")
          klass = Object.const_get("PricingRules::#{rule_name}")
        end
      end
      
      klass ? klass.new(item, **conf[:options]) : Rule.new(item, **{})
    end
  end
end
