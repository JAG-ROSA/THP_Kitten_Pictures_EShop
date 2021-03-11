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
    @orders = User.where(id: current_user.id).first.cart.order_items.all
  end

  def update_params
    params.permit(:first_name, :last_name, :avatar)
  end

  def update
    @user = helpers.current_user
    @user.first_name = update_params[:first_name]
    @user.last_name = update_params[:last_name]
    @user.avatar = update_params[:avatar]

    if @user.save
      redirect_to user_path(@user.id)
      flash[:success] = "Your information has been udpated."
    else
      flash[:danger] = "Failure: " + @user.errors.full_messages.join(" ")
      render :edit
    end
  end

  def destroy
  end
end
