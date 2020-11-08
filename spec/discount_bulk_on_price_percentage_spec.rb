RSpec.describe PricingRules::DiscountBulkOnPricePercentage do
  let(:options) do
    {
      validation: 'greater_than_or_equal_to',
      percentage: 0.6667,
      count: 3
    }
  end

  let(:item) do
    Struct.new(:code, :price, :count)
          .new('CF1', 11.23, 3)
  end

  it 'returns a valid total' do
    expect(
      described_class.new(item, **options).total
    ).to eq(22.46)
  end
end