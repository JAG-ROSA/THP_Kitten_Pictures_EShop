class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def show
    @user = User.find(params[:id])
  end
end
