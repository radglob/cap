class AddressesController < ApplicationController
  def new
    @address = Address.new(user_id: current_user.id)
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    if @address.save
      redirect_to root_path, message: 'Address added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def address_params
    params.require(:address).permit(:address1, :address2, :city, :state, :zip_code)
  end
end
