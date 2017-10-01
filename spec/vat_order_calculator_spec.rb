require "spec_helper"

describe VatOrderCalculator do
  describe "#vat_rate" do
    it "returns base country vat rate if same country and company" do
      calculator = VatOrderCalculator.new(base_country: "DK", country: "DK", private_customer: false)

      expect(calculator.vat_rate).to eq 25.0
    end
  end
end
