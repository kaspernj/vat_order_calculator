require "spec_helper"

describe VatOrderCalculator::VatRate do
  describe "#rate" do
    it "returns base country vat rate if same country and private" do
      calculator = VatOrderCalculator::VatRate.new(base_country: "DK", country: "DK", private_customer: true)
      expect(calculator.rate).to eq 25.0
    end

    it "returns base country vat rate if same country and company" do
      calculator = VatOrderCalculator::VatRate.new(base_country: "DK", country: "DK", private_customer: false)
      expect(calculator.rate).to eq 25.0
    end

    it "returns customer country vat if different country and private" do
      calculator = VatOrderCalculator::VatRate.new(base_country: "DK", country: "DE", private_customer: true)
      expect(calculator.rate).to eq 19.0
    end

    it "returns zero if different country and company" do
      calculator = VatOrderCalculator::VatRate.new(base_country: "DK", country: "DE", private_customer: false)
      expect(calculator.rate).to eq 0.0
    end
  end
end
