require "spec_helper"

describe VatOrderCalculator::CountryIp do
  let(:russia_ip) { "213.180.204.26" }

  describe "#country_code" do
    it "returns the correct country code" do
      country_ip = VatOrderCalculator::CountryIp.new(ip: russia_ip)

      expect(country_ip.country_code).to eq "RU"
    end
  end
end
