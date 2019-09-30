class RelationshipsController < ApplicationController
  before_action :logged_in_user
  
  def create
   @user = User.find(params[:relationship][:following_id])
   current_user.follow!(@user)
   redirect_back(fallback_location: root_path)
 end

 def destroy
   @user = Relationship.find(params[:id]).following
   current_user.unfollow!(@user)
   redirect_back(fallback_location: root_path)
 end
end