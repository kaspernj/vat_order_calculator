class VatOrderCalculator::Validator
  attr_reader :base_country_code, :country_code, :errors, :private_customer

  def initialize(base_country_code:, country_code:, private_customer:, **args)
    @base_country_code = base_country_code
    @country_code = country_code
    @private_customer = private_customer
    @args = args
    @errors = []
  end

  def validate
    @errors = []
    errors << "Invalid vat number" if args[:vat_number].present? && !vat_number.valid?
  end

  def valid?
    validate

    if errors.any?
      false
    else
      true
    end
  end

private

  def vat_number
    @_vat_number ||= VatNumber.new(vat_number: args[:vat_number])
  end

  def vat_rate
    @_vat_rate ||= VatRate.new(base_country: base_country, country: country, private_customer: private_customer)
  end
end
