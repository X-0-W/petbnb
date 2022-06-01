class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

  after_action :verify_authorized, except: [:index, :map], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:index, :map], unless: :skip_pundit?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:age, :username])

    devise_parameter_sanitizer.permit(:account_update, keys: [:age, :username])
  end


  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

end
