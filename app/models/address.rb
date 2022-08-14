class Address < ApplicationRecord
  belongs_to :user

  enum :state, AddressHelper::STATES
end
