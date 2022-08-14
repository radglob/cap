require 'usps'

class AddressValidation
  def initialize(username:)
    USPS.config.username = username
  end

  def validate(address1:, address2:, city:, state:, zip_code:)
    zip5, zip4 = zip_code.split('-')
    address = USPS::Address.new(address1:, address2:, city:, state:, zip4:,
                                zip5:)
    puts address.inspect
    request = USPS::Request::AddressStandardization.new(address)
    response = request.send!
    response.get(address)
  end
end
