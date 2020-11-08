module PricingRules
  RSpec.describe Checkout do
    TEST_CASES = [
      {
        basket: "GR1,SR1,GR1,GR1,CF1",
        total_price_expected: 22.45
      },
      {
        basket: "GR1,GR1",
        total_price_expected: 3.11
      },
      {
        basket: "SR1,SR1,GR1,SR1",
        total_price_expected: 16.61
      },
      {
        basket: "GR1,CF1,SR1,CF1,CF1",
        total_price_expected: 30.57
      }
    ]

    TEST_CASES.map.with_index do |test, i|
      it "retunrs valid total for test case N° #{i+1}" do
        checkout = described_class.new(Rule.all)
        test[:basket].split(',').each { |code| checkout.scan(code) }
        expect(checkout.total).to eq(test[:total_price_expected])
      end
    end
  end
end
