class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email,:date_of_birth,:gender,:chess_ability,:profile,:membership_status])
  end
end
