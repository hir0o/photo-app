class ApplicationController < ActionController::Base
  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?
  PER = 6

  def after_sign_in_path_for(resource)
    current_user 
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_up_path_for(resource)
    current_user
  end

  def after_inactive_sign_up_path_for(resource)
    current_user
  end

  protected
    def configure_permitted_parameters
      # サインアップ時にnameのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :profile_image])
      # アカウント編集の時にnameとprofileのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :profile_image])
    end

    def after_update_path_for(resource)
      current_user
    end

    private
  
    def logged_in_user
      unless user_signed_in?
        redirect_to root_path, flash: {denger: 'ログインしてください。'}
      end
    end

    
end
