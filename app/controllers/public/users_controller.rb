class Public::UsersController < ApplicationController

  def index
    @users = User.page(params[:page]).reverse_order
    # ransack
    @q = User.search(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def retire
    @user = User.find(params[:id])
  end

  def update_retire
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session # ログアウト
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :introduction, :profile_image, :email)
  end
end
