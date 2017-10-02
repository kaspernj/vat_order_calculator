require "json_vat"

class VatOrderCalculator::VatRate
  attr_reader :base_country, :country, :private_customer

  def initialize(base_country:, country:, private_customer:)
    @base_country = base_country
    @country = country
    @private_customer = private_customer
  end

  def rate
    if base_country == country
      JSONVAT.country(country).rate
    elsif private_customer
      JSONVAT.country(country).rate
    else
      0.0
    end
  end
end
