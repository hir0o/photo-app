class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = current_user.comments.create(content: params[:comment][:content], post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment, :post_id).permit(:content)
  end
end
