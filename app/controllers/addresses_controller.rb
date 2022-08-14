class AddressesController < ApplicationController
  def new
    @address_form = AddressForm.new
  end

  def create

  end

  private

  def address_params
    params.require(:address).permit(:address1, :address2, :city, :state, :zip_code)
  end

  def to_params(address)
    puts address.inspect
    nil
  end
end
