class ApplicationController < ActionController::Base
  before_action :require_address, if: :user_signed_in?

  protected

  def require_address
    redirect_to :new_user_address_path(current_user) unless current_user.address?
  end
end
