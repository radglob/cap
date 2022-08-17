class AddressesController < ApplicationController
  def new
    @form = AddressForm.new(Address.new)
  end

  def create
    @form = AddressForm.new(Address.new)
    if @form.validate(params[:address])
      @form.save
      redirect_to new_user_validated_addresses_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
