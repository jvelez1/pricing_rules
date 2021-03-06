RSpec.describe PricingRules::Rules::DiscountBulkOnPriceValue do
  let(:options) do
    {
      validation: 'greater_than_or_equal_to',
      quantity: 3,
      forced_price: 4.5
    }
  end

  let(:item) do
    Struct.new(:code, :price, :quantity)
          .new('SR1', 5, 3)
  end

  it 'returns a valid total' do
    expect(
      described_class.new(item, **options).total
    ).to eq(13.5)
  end
end
