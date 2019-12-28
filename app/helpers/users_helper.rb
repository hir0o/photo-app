module UsersHelper
  def current_user?(user)
    user == current_user
  end

  def user_list_title
    if controller.action_name == "index"
      "ユーザー一覧"
    elsif controller.action_name == "following"
      "フォロー中"
    elsif controller.action_name == "followers"
      "フォローワー"
    end
  end
end
