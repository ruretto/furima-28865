class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,  :email, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day])
  end

  private

  def basic_authentication
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '12345a'
    end
  end
end