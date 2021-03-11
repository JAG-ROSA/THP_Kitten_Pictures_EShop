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
    @flash = []
    if !@cart_item
      if @new_item.save
        @flash << ["success", "Item added to the cart"]
      end
    else
      @flash << ["danger", "Item already added to the cart"]
    end

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def destroy
  end
end
