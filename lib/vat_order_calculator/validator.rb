class VatOrderCalculator::Validator
  attr_reader :args, :base_country, :country, :errors, :private_customer

  def initialize(base_country:, country:, private_customer:, **args)
    @base_country = base_country
    @country = country
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

  def vat_rate
    @_vat_rate ||= VatOrderCalculator::VatRate.new(base_country: base_country, country: country, private_customer: private_customer)
  end

private

  def vat_number
    @_vat_number ||= VatOrderCalculator::VatNumber.new(vat_number: args[:vat_number])
  end
end
