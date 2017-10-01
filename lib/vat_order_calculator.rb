module VatOrderCalculator
  path = "#{File.dirname(__FILE__)}/vat_order_calculator"

  autoload :CountryIp, "#{path}/country_ip"
  autoload :CreditCardCountry, "#{path}/credit_card_country"
  autoload :VatNumber, "#{path}/vat_number"
  autoload :VatRate, "#{path}/vat_rate"
end
