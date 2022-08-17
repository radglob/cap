class ValidatedAddress < ApplicationRecord
  belongs_to :user

  def self.from_usps_address(address, user_id)
    attrs = address.to_h.slice(:address1, :address2, :city, :state, :zip5, :zip4).map do |k, v|
      if k == :state
        [k, v]
      else
        [k, v.downcase.split.map(&:capitalize).join(' ')]
      end
    end.to_h

    attrs[:user_id] = user_id

    ValidatedAddress.create(attrs)
  end

  def display
    "#{address1}
     #{address2}
     #{city}, #{state}, #{zip5}-#{zip4}"
  end
end
