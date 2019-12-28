class Users::RegistrationsController < Devise::RegistrationsController
  def after_update_path_for(_resource)
    current_user
  end
end
