class Users::InvitationsController < Devise::InvitationsController
  devise_for :users, :controllers => { :invitations => 'users/invitations' }

  def update
    if some_condition
      redirect_to root_path
    else
      super
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:tourist_first_name, :tourist_last_name])
  end

end
