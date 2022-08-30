class ValidatedAddressesController < ApplicationController
  before_action :user_authenticated

  def new
    @address = Address.find_by(user_id: current_user.id)
    @validated_address = validated_address
  end

  def create
    @address = Address.find_by(user_id: current_user.id)
    @validated_address = validated_address
    if params[:use_corrected] == 'false'
      # Leave address as is.
      redirect_to root_path, notice: 'Thanks for entering your address.'
    else
      @address.update_from_validated_address(@validated_address)
      redirect_to root_path, notice: 'Address updated to corrected information.'
    end
  end

  private

  def validated_address
    validated_address = ValidatedAddress.find_by(user_id: current_user.id)
    return validated_address if validated_address.present?

    valid_address = AddressValidation.new(username: ENV['USPS_USERNAME']).validate(@address)
    ValidatedAddress.from_usps_address(valid_address, current_user.id)
  end

  def user_authenticated
    redirect_to root_path unless user_signed_in?
  end
end
