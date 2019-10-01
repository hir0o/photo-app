class RelationshipsController < ApplicationController
  before_action :logged_in_user
  
  def create
   @user = User.find(params[:relationship][:following_id])
   current_user.follow!(@user)
  #  redirect_back(fallback_location: root_path)
    p "--"*60
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
 end

 def destroy
   @user = Relationship.find(params[:id]).following
   current_user.unfollow!(@user)
   p "--"*60
  #  redirect_back(fallback_location: root_path)
  respond_to do |format|
    format.html { redirect_back(fallback_location: root_path) }
    format.js
  end
 end
end