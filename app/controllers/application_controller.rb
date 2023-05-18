class ApplicationController < ActionController::Base
 before_action :authenticate_user!
 before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name posts_count email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name posts_count email password current_password])
  end
end
