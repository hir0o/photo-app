class RelationshipsController < ApplicationController
  before_action :logged_in_user
  
  def create
   @f_user = User.find(params[:relationship][:following_id])
   current_user.follow!(@f_user)
 end

 def destroy
   @f_user = Relationship.find(params[:id]).following
   current_user.unfollow!(@f_user)
 end
end