class Public::RelationshipsController < ApplicationController

  before_action :authenticate_user!

  def following
  	@user = User.find(params[:id])
  	@users = @user.following.page(params[:page]).reverse_order
  end

  def followers
  	@user = User.find(params[:id])
  	@users = @user.followers.page(params[:page]).reverse_order
  end

  def create
  	@user = User.find(params[:follow_id])
  	following = current_user.follow(@user)
  	following.save
  	redirect_back(fallback_location: posts_path)
  end

  def destroy
  	@user = User.find(params[:follow_id])
  	following = current_user.unfollow(@user)
  	following.destroy
  	redirect_back(fallback_location: posts_path)
  end
end
