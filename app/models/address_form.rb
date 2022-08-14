class AddressForm < Reform::Form
  feature Reform::Form::Dry

  property :address1
  property :address2
  property :city
  property :state
  property :zip_code

  validation :default do
    required(:address1).filled
    required(:city).filled
    required(:state).filled
    required(:zip_code).filled
  end

  rule(:zip_code) do
    key.failure('must be a 5 digit or 9 digit zip code') if value.length != 5 || value.length != 10
  end
end
