class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create(content: params[:comment][:content], post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
    # if @comment.save
    #   p "成功！！！！！！！！！！！！！！！！！！！！！"
    #   redirect_back(fallback_location: root_path)
    # else
    #   p "失敗！！！！！！！！！！！！！！！！！！！！！"
    #   redirect_back(fallback_location: root_path)
    # end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment, :post_id).permit(:content)
  end
end
