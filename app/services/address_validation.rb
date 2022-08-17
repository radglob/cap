require 'usps'

class AddressValidation
  def initialize(username:)
    USPS.config.username = username
  end

  def validate(address)
    zip5, zip4 = address.zip_code.split('-')
    @address = USPS::Address.new(
      address1: address.address1, address2: address.address2, city: address.city,
      state: address.state, zip4:, zip5:
    )
    fetch_address
  end

  private

  def fetch_address
    request = USPS::Request::AddressStandardization.new(@address)
    response = request.send!
    response.get(@address)
  end
end
