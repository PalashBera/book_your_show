class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def authenticate_admin
    return if current_user.admin?

    redirect_to root_path, flash: { danger: t("unauthorized_access") }
  end
end
