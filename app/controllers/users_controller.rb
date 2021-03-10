class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
    @user = helpers.current_user
  end

  def create
  end

  def show
    @user = helpers.current_user
    @orders = @user.orders
  end

  def update_params
    params.permit(:first_name, :last_name)
  end

  def update
    @user = helpers.current_user
    @user.first_name = update_params[:first_name]
    @user.last_name = update_params[:last_name]

    if @user.save
      redirect_to user_path(@user.id)
      flash[:success] = "Your information have been udpated."
    else
      flash[:danger] = "Echec : " + @user.errors.full_messages.join(" ")
      render :edit
    end
  end

  def destroy
  end
end
