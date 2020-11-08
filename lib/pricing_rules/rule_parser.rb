module PricingRules
  class RuleParser
    def self.parse(item, conf = nil)
      rule_name = conf[:name] if conf
      if rule_name
        if Object.const_defined?("PricingRules::Rules::#{rule_name}")
          klass = Object.const_get("PricingRules::Rules::#{rule_name}")
        end
      end
      
      klass ? klass.new(item, **conf[:options]) : Rules::Base.new(item, **{})
    end
  end
end
