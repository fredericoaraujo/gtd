class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_params, if: :devise_controller?
  layout :layout_by_resource

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private
  def layout_by_resource
    if devise_controller? && action_name != 'edit'
      'login'
    else
      'application'
    end
  end
end
