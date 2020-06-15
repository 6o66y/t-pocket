class Public::ToDoListsController < ApplicationController

  def create
  	@user = User.find(params[:user_id])
  	@to_do_list = @user.to_do_lists.new(to_do_list_params)
  	@to_do_list.user_id = current_user.id
  	@to_do_list.save
  end

  def destroy
  	@to_do_list = ToDoList.find(params[:user_id])
    @user = @to_do_list.user
    @to_do_list.destroy
  end

  private
  def to_do_list_params
  	params.require(:to_do_list).permit(:to_do)
  end
end
