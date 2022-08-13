class ApplicationController < ActionController::Base
  before_action :require_address, if: :user_signed_in?

  protected

  def require_address
    unless current_user.address? || request.path == new_user_address_path(current_user)
      redirect_to new_user_address_path(current_user)
    end
  end
end
