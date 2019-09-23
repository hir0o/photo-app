module ApplicationHelper
  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !current_user.nil?
  end
end
