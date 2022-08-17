class Address < ApplicationRecord
  belongs_to :user

  enum :state, AddressHelper::STATES

  def display
    "#{address1}
     #{address2}
     #{city}, #{state}, #{zip_code}"
  end

  def update_from_validated_address(validated_address)
    self.address1 = validated_address.address1
    self.address2 = validated_address.address2
    self.city = validated_address.city
    self.state = validated_address.state
    self.zip_code = "#{validated_address.zip5}-#{validated_address.zip4}"
    save!
  end
end
