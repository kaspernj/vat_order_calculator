require "spec_helper"

describe VatOrderCalculator::VatNumber do
  let(:invalid_vat_number) { VatOrderCalculator::VatNumber.new(vat_number: "IE6asd388047V") }
  let(:vat_number_google) { VatOrderCalculator::VatNumber.new(vat_number: "IE6388047V") }

  describe "#country_code" do
    it "returns the correct country" do
      expect(vat_number_google.country_code).to eq "IE"
    end

    it "fails on invalid vat number" do
      expect { invalid_vat_number.country_code }.to raise_error(VatOrderCalculator::VatNumber::InvalidVatNumber)
    end
  end

  describe "#valid?" do
    it "returns true for valid vat numbers" do
      expect(vat_number_google.valid?).to eq true
    end

    it "reutns false for invalid vat numbers" do
      expect(invalid_vat_number.valid?).to eq false
    end
  end
end
