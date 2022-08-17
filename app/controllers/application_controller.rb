class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(user)
    if user.address?
      root_path
    else
      new_user_addresses_path(user)
    end
  end
end
