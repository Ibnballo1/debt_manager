class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Catch all CanCan errors and alert the user of the exception
  rescue_from CanCan::AccessDenied do | exception |
    redirect_to debts_url, alert: "Access denied! You are not authorized to perform this action."
  end

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_up_path_for(resource)
    creditors_path(resource) # Redirect to the debts page after sign-up
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = "Signed in successfully"
    creditors_path # Redirect to the debts page after sign-in
  end

  def after_sign_out_path_for(resource)
    root_path(resource) # Redirect to the user's profile page after sign-up
  end
end
