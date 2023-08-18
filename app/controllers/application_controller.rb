class ApplicationController < ActionController::Base
  protected

  def after_sign_up_path_for(resource)
    debts_path(resource) # Redirect to the user's profile page after sign-up
  end

  def after_sign_in_path_for(resource)
    debts_path(resource) # Redirect to the user's profile page after sign-up
  end

  def after_sign_out_path_for(resource)
    root_path(resource) # Redirect to the user's profile page after sign-up
  end
end
