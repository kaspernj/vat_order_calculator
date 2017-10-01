require "spec_helper"

describe VatOrderCalculator do
  describe "#vat_rate" do
    it "returns base country vat rate if same country and private" do
      calculator = VatOrderCalculator.new(base_country: "DK", country: "DK", private_customer: true)
      expect(calculator.vat_rate).to eq 25.0
    end

    it "returns base country vat rate if same country and company" do
      calculator = VatOrderCalculator.new(base_country: "DK", country: "DK", private_customer: false)
      expect(calculator.vat_rate).to eq 25.0
    end

    it "returns customer country vat if different country and private" do
      calculator = VatOrderCalculator.new(base_country: "DK", country: "DE", private_customer: true)
      expect(calculator.vat_rate).to eq 19.0
    end

    it "returns zero if different country and company" do
      calculator = VatOrderCalculator.new(base_country: "DK", country: "DE", private_customer: false)
      expect(calculator.vat_rate).to eq 0.0
    end
  end
end
