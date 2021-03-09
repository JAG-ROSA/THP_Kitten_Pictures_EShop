module CartsHelper
  def cart_item_id(cart, item)
    CartItem.all.where(cart_id: cart.id, item_id: item.id).first.id
  end
end
