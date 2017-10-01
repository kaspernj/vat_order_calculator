require "geocoder"

class VatOrderCalculator::CountryIp
  attr_reader :ip

  def initialize(ip:)
    @ip = ip
  end

  def country_code
    Geocoder.search(ip).first.country_code
  end
end
