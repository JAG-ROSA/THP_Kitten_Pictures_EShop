class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
  end

  def show
    @users = User.all.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    post_params = params.permit(:first_name, :last_name, :avatar)

    if @user.update(post_params)
      redirect_to root_path, success: "User profile updated!"
    else
      redirect_to root_path, danger: "Can't update user profile" + @user.errors.full_messages.join(" ")
    end
  end

  def destroy
  end
end
