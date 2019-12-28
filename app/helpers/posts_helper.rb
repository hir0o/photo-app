module PostsHelper
  def edited?(comment)
    "編集済み" unless comment.created_at == comment.updated_at
  end

  def post_list_title
    if @tag_name
      "「#{@tag_name}」の検索結果"
    elsif @search
      "「#{@search}」の検索結果"
    else
      "投稿一覧"
    end
  end
end
