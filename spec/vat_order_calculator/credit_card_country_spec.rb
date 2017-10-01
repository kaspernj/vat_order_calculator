require "spec_helper"

describe VatOrderCalculator::CreditCardCountry do
  let(:french_visa) { VatOrderCalculator::CreditCardCountry.new(credit_card_number: "497040") }

  describe "#country_code" do
    it "returns the french country code for a french credit card" do
      expect(french_visa.country_code).to eq "FR"
    end
  end
end
