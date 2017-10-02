require "spec_helper"

describe VatOrderCalculator::Validator do
  let(:validator) { VatOrderCalculator::Validator.new(base_country: "DK", country: "DK", private_customer: true) }

  describe "#validate" do
    it "registers invalid vat numbers" do
      validator = VatOrderCalculator::Validator.new(base_country: "DK", country: "DK", private_customer: true, vat_number: "asdasd")
      validator.validate

      expect(validator.errors).to eq ["Invalid vat number"]
      expect(validator.vat_rate.rate).to eq 25.0
    end
  end

  describe "#valid?" do
    it "returns true when everything is ok" do
      expect(validator.valid?).to eq true
    end
  end
end
