module PricingRules
  class Item < Struct.new(:code, :price, :count, :rule_conf)
    def increase!(num = 1)
      self.count += num
    end

    def total
      rule.total
    end

    private

    def rule
      RuleParser.parse(self, rule_conf&.rule || {})
    end
  end
end
