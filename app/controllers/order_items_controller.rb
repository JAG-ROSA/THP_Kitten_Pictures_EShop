class OrderItemsController < ApplicationController
  def create
    # Find associated product and current cart
    chosen_product = Item.find(params[:product_id])
    current_cart = @current_cart
  
    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
    if current_cart.products.include?(chosen_product)
      # Find the line_item with the chosen_product
      @line_item = current_cart.line_items.find_by(:product_id => chosen_product)
      # Iterate the line_item's quantity by one
      @line_item.quantity += 1
    else
      @line_item = OrderItem.new
      @line_item.cart = current_cart
      @line_item.product = chosen_product
    end
  
    # Save and redirect to cart show path
    @line_item.save
    redirect_to cart_path(current_cart)
  end

  def add_quantity
    @cart_item = OrderItem.find(params[:id])
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to cart_path(@current_cart)
  end
  
  def reduce_quantity
    @cart_item = OrderItem.find(params[:id])
    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
    end
    @cart_item.save
    redirect_to cart_path(@current_cart)
  end
end
