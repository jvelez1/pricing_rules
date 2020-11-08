RSpec.describe PricingRules::Item do
  it 'should increase the item counter with a default number' do
    item = described_class.new('GRC', 3.11, 2, nil)
    item.increase!

    expect(item.quantity).to eq(3)
  end

  it 'should increase the item counter with by number' do
    item = described_class.new('GRC', 3.11, 2, nil)
    item.increase!(2)

    expect(item.quantity).to eq(4)
  end

  context 'When rule conf is nil' do
    it 'returns a common total' do
      expect(
        described_class.new('GRC', 3.11, 2, nil).total
      ).to eq(6.22)
    end
  end

  context 'When rule is BuyAndGet' do
    let(:rule_conf) do
      Struct.new(:rule).new(
        class: 'BuyAndGet',
        options: {
          buy: 1,
          get: 1
        }
      )
    end
  
    it 'returns a valid total' do
      expect(
        described_class.new('GRC', 3.11, 2, rule_conf).total
      ).to eq(3.11)
    end
  end
end