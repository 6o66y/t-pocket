class Public::UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.page(params[:page]).reverse_order
    # ransack
    @q = User.search(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts.page(params[:page]).reverse_order
    @to_do_list = ToDoList.new
    @to_do_lists = @user.to_do_lists.page(params[:page]).reverse_order
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

  def edit_password
    @user = User.find(params[:id])
  end

  def update_password
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit_password
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :introduction, :profile_image, :email, :password, :password_confirmation)
  end
end
