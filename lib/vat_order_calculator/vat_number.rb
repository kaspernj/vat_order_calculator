require "valvat"

class VatOrderCalculator::VatNumber
  class InvalidVatNumber < RuntimeError; end

  attr_reader :valvat, :vat_number

  def initialize(vat_number:)
    @vat_number = vat_number
    @valvat = Valvat.new(vat_number)
  end

  def country_code
    raise InvalidVatNumber unless valid?
    details.fetch(:country_code)
  end

  def valid?
    valvat.valid?
  end

private

  def details
    @_details ||= valvat.exists?(detail: true)
  end
end
