module PricingRules
  RSpec.describe Checkout do
    PRODUCTS = [
      {
        name: "Green tea",
        code: "GR1",
        price: 3.11
      },
      {
        name: "Strawberries",
        code: "SR1",
        price: 5
      },
      {
        name: "Coffe",
        code: "CF1",
        price: 11.23
      }
    ]

    RULES = [
      {
        on: "GR1",
        rule: {
          class: "BuyAndGet",
          options: {
              buy: 1,
              get: 1
            }
         }
      },
      {
        on: "SR1",
        rule: {
          class: "DiscountBulkOnPriceValue",
          options: {
              validation: "greater_than_or_equal_to",
              quantity: 3,
              forced_price: 4.5
            }
         }
      },
      {
        on: "CF1",
        rule: {
          class: "DiscountBulkOnPricePercentage",
          options: {
              validation: "greater_than_or_equal_to",
              percentage: 0.6667,
              quantity: 3
            }
         }
      }
    ]

    TEST_CASES = [
      {
        basket: 'GR1,SR1,GR1,GR1,CF1',
        total_price_expected: 22.45
      },
      {
        basket: 'GR1,GR1',
        total_price_expected: 3.11
      },
      {
        basket: 'SR1,SR1,GR1,SR1',
        total_price_expected: 16.61
      },
      {
        basket: 'GR1,CF1,SR1,CF1,CF1',
        total_price_expected: 30.57
      }
    ]

    let(:products) do
      PRODUCTS.map do |p|
        Product.new(p[:code], p[:name], p[:price])
      end
    end

    let(:rules) do
      RULES.map do |r|
        Rule.new(r[:on], class: r.dig(:rule, :class), options: r.dig(:rule, :options))
      end
    end

    before do
      allow(Product).to receive(:all).and_return(products)
    end


    TEST_CASES.map.with_index do |test, i|
      it "retunrs valid total for test case N° #{i+1}" do
        checkout = described_class.new(rules)
        test[:basket].split(',').each { |code| checkout.scan(code) }
        expect(checkout.total).to eq(test[:total_price_expected])
      end
    end
  end
end
