class Users::InvitationsController < Devise::InvitationsController
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:tourist_first_name, :tourist_last_name])
  end

end
