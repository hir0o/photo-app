module ApplicationHelper
  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def created_date(object)
    object.created_at.strftime('%m月%d日')
  end
  
  def serch_placeholder
    if controller.controller_name == "posts"
      "キーワードで投稿を検索"
    elsif controller.controller_name == "users"
      "キーワードでユーザーを検索"
    end
  end
end
