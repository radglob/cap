class ApplicationController < ActionController::Base
  before_action :set_variant

  protected

  def after_sign_in_path_for(user)
    if user.admin?
      avo_path
    elsif user.address?
      root_path
    else
      new_user_addresses_path(user)
    end
  end

  private

  def set_variant
    request.variant = :mobile if mobile?
  end

  def mobile?
    request.user_agent =~ /Mobile|webOS/
  end
end
