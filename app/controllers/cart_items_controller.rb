class CartItemsController < ApplicationController
  def create
    @cart = Cart.find(params[:id])
    @cart_item = CartItem.new(cart: params[:cart], item: params[:item])
    if @cart_item.save
      flash[:success] = "Item added to the cart"
      redirect_to controller:'carts', action: 'show', id: @cart.id
    else
      render root_path
    end
  end
end
