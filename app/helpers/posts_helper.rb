module PostsHelper
  def edited?(comment)
     "編集済み" unless comment.created_at == comment.updated_at
  end
end
