RSpec.describe PricingRules::BuyAndGet do
  let(:options) do
    {
      buy: 1,
      get: 1
    }
  end

  let(:item) do
    Struct.new(:code, :price, :count)
          .new('GRC', 3.11, 2)
  end

  it 'returns a valid total' do
    expect(
      described_class.new(item, **options).total
    ).to eq(3.11)
  end
end