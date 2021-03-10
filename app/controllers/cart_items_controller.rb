class CartItemsController < ApplicationController
  def create
    chosen_product = Item.find(params[:product_id])
    current_cart = @current_cart
=begin
    @cart = Cart.find(params[:id])
    @cart_item = CartItem.new(cart: params[:cart], item: params[:item])
    if @cart_item.save
      flash[:success] = "Item added to the cart"
      redirect_to controller: "carts", action: "show", id: @cart.id
    else
      render root_path
    end
=end
# If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
if current_cart.items.include?(chosen_product)
  # Find the line_item with the chosen_product
  @cart_item = current_cart.cart_items.find_by(:item_id => chosen_product)
  # Iterate the line_item's quantity by one
  @cart_item.quantity += 1
else
  @cart_item = CartItem.new
  @cart_item.cart = current_cart
  @cart_item.item = chosen_product
end

# Save and redirect to cart show path
@cart_item.save
redirect_to cart_path(current_cart)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_back(fallback_location: root_path)
    flash[:warning] = "Item removed from the cart"
  end

  def add_quantity
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to cart_path(@current_cart)
  end
  
  def reduce_quantity
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
    end
    @cart_item.save
    redirect_to cart_path(@current_cart)
  end
end
