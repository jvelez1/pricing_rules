module PricingRules
  class Item < Struct.new(:code, :price, :quantity, :rule_conf)
    def increase!(num = 1)
      self.quantity += num
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
