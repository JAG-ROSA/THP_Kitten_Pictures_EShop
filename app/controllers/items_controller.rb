class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
  end

  def show
    @item = Item.find(params[:id])
    @orders = Order.all
  end

  def create
  end

  def update
    @cart = Cart.find(session[:cart_id])
    @cart_item = CartItem.find_by(cart_id: @cart.id, item_id: params[:id])
    @new_item = CartItem.new(cart_id: @cart.id, item_id: params[:id], quantity: params[:quantity])
    if !@cart_item
      if @new_item.save
        flash[:success] = "Item added to the cart"
        redirect_back(fallback_location: root_path)
      else
        render action: "show"
      end
    else
      flash[:danger] = "Item already added to the cart"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
  end
end
