class AddressForm < Reform::Form
  feature Reform::Form::Dry

  properties :address1, :address2, :city, :state, :zip_code

  validation do
    params do
      required(:address1).filled
      required(:city).filled
      required(:state).filled
      required(:zip_code).filled
    end

    rule(:zip_code) do
      key.failure('zip code must be 5 or 10 characters (including the dash)') if value.length != 5 && value.length != 10
    end
  end
end
