class CartsController < ApplicationController
  before_action :authenticate_user, only: [:show, :edit, :update, :destroy]
  before_action :is_owner, only: [:show, :edit, :update, :destroy]

  def index
    @carts = Cart.all
  end

  def show
    @user = User.find(params[:id])
    Cart.where(user_id: @user)
  end

  private

  def authenticate_user
    unless current_user 
      flash[:danger] = "This section requires to be logged-in. Please log in."
      redirect_to new_user_registration_path
    end
  end

  def is_owner
    if current_user.id.to_i != params[:id].to_i
      redirect_to "/"
    end
  end
end
