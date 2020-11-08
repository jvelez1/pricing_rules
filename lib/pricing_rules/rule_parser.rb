module PricingRules
  class RuleParser
    def self.parse(item, rule_conf)
      klass_name = rule_conf[:class]
      options = rule_conf[:options]&.transform_keys(&:to_sym)
      if klass_name
        deep_klass_name = "PricingRules::Rules::#{klass_name}"
        if Object.const_defined?(deep_klass_name)
          klass = Object.const_get(deep_klass_name)
        end
      end
      
      klass ? klass.new(item, **options) : Rules::Base.new(item, **{})
    end
  end
end
