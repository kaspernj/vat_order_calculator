require "credit_card_bins"

class VatOrderCalculator::CreditCardCountry
  attr_reader :bin, :credit_card_number

  def initialize(credit_card_number:)
    @credit_card_number = credit_card_number
    @bin = CreditCardBin.new(credit_card_number)
  end

  def country_code
    bin.country.fetch("alpha_2")
  end

  def valid?
    bin.bin
  end
end
