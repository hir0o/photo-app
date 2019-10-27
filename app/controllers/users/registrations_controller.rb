class Users::RegistrationsController < Devise::RegistrationsController

  def after_update_path_for(resource)
    current_user
  end

end
