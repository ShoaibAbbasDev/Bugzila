# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :authenticate_user!
  add_flash_types :info, :danger, :warning
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :role, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :role, :password, :current_password)
    end
  end

  private

  def user_not_authorized
    flash[:alert] = 'Sorry, You are not authorized to perform this action.'
    redirect_back(fallback_location: root_path)
  end
end
