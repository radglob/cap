class AddressesController < ApplicationController
  before_action :user_authenticated

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

  private

  def user_authenticated
    redirect_to root_path unless user_signed_in?
  end
end
