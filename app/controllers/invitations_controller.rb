# frozen_string_literal: true

class InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters

  def create
    super do |resource|
      resource.role = params[:user][:role]
      resource.name = params[:user][:name]
      resource.save
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:user, keys: %i[email name role])
  end
end
