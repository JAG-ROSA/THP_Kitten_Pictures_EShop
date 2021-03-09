class CartsController < ApplicationController
  before_action :authenticate_user, only: [:show, :edit, :update, :destroy]
  before_action :is_owner, only: [:show, :edit, :update, :destroy]

  def index
    @carts = Cart.all
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(user_id: current_user.id)
    if @cart.save
      flash[:success] = "Cart created"
      redirect_to controller:'carts', action: 'show', id: @cart.id
  else
    render root_path
  end
  end

  private

  def authenticate_user
    unless current_user 
      flash[:danger] = "This section requires to be logged-in. Please log in."
      redirect_to new_user_registration_path
    end
  end

  def is_owner
    if Cart.where(user_id: current_user.id).first.id.to_i != params[:id].to_i
      redirect_to "/"
    end
  end
  
end
