class Address < ApplicationRecord
  belongs_to :user

  enum :state, AddressHelper::STATES

  validates :address1, :city, :state, :zip_code, presence: true
  validates :zip_code, length: { minimum: 5, maximum: 10 }
end
