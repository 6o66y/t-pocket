# frozen_string_literal: true

class Public::TimelinesController < ApplicationController
  before_action :authenticate_user!
  after_action :read

  def timeline
    @user = User.find(current_user.id)
    @following_users = @user.following
    @posts = Post.where(user_id: @following_users).page(params[:page]).reverse_order
    @recommendations = Post.order('RAND()').limit(5)
  end

  private

  def read
    @user = current_user
    @user.read_at = Time.zone.now
    @user.save
  end
end
