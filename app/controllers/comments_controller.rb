class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = current_user.comments.create(content: params[:comment][:content], post_id: params[:post_id])
    @post = Post.find(params[:post_id])
    # respond_to do |format|
    #   if @comment.save
    #     flash.now[:success] = "コメントを投稿しました。"
    #     format.html { redirect_back(fallback_location: root_path) }
    #     format.js
    #   else
    #     flash.now[:danger] = "失敗しました。"
    #     format.html { redirect_back(fallback_location: root_path) }
    #     format.js
    #   end
    # end
  end

  def destroy
  end

  def edit
    @comment = Comment.find(post_id: params[:post_id], id: params[:id])
  end

  def update
  end

  private
    def comment_params
      params.require(:comment, :post_id).permit(:content)
    end
end
