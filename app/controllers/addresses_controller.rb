class AddressesController < ApplicationController
  def new
    @address_form = AddressForm.new(Address.new)
  end

  def create
    @address_form = AddressForm.new(Address.new)
    if @address_form.validate(params[:address])
      @address_form.save
      redirect_to validate_address_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
