RSpec.describe PricingRules::RuleParser do
  let(:item) do
    Struct.new(:code, :price, :count)
          .new('GRC', 3.11, 2)
  end

  describe '#parse' do
    it 'retuns base rule instance' do
      expect(
        described_class.parse(item, nil)
      ).to be_a(PricingRules::Rule)
    end

    context 'When there is valid conf' do
      let(:conf) do
        {
          name: 'DiscountBulkOnPricePercentage',
          options: {
            validation: 'greater_than_or_equal_to',
            percentage: 0.6667,
            count: 3
          }
        }
      end
    
      it 'returns a valid instance' do
        expect(
          described_class.parse(item, **conf)
        ).to be_a(PricingRules::DiscountBulkOnPricePercentage)
      end
    end
  end
end