RSpec.describe PricingRules::RuleParser do
  let(:item) do
    Struct.new(:code, :price, :quantity)
          .new('GRC', 3.11, 2)
  end

  describe '#parse' do
    it 'retuns base rule instance' do
      expect(
        described_class.parse(item, {})
      ).to be_a(PricingRules::Rules::Base)
    end

    context 'When there is valid conf' do
      let(:conf) do
        {
          name: 'DiscountBulkOnPricePercentage',
          options: {
            validation: 'greater_than_or_equal_to',
            percentage: 0.6667,
            quantity: 3
          }
        }
      end
    
      it 'returns a valid instance' do
        expect(
          described_class.parse(item, **conf)
        ).to be_a(PricingRules::Rules::DiscountBulkOnPricePercentage)
      end
    end
  end
end