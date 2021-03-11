class CheckoutController < ApplicationController
  def create
    @user = current_user
    cart_id = params[:cart_id].to_i
    @total = Cart.find(session[:cart_id]).total
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      line_items: [
        {
          name: "The Kitten Project Stripe Checkout",
          amount: (@total * 100).to_i,
          currency: "eur",
          quantity: 1,
        },
      ],
      success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url,
    )
    respond_to do |format|
      format.js
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @cart_id = Cart.all.where(user_id:current_user.id)
    new_order = Order.create(cart_id: @cart_id.first.id, amount: @cart_id.first.total)
    cart_item = CartItem.all.where(cart_id: @cart_id)
    
      cart_item.each do |cart_item|
        OrderItem.create!(order: new_order, item: cart_item.item, quantity: cart_item.quantity, cart_id: @cart_id.first.id)
      end
    
    CartItem.all.where(cart_id: @cart_id).destroy_all
  end

  def cancel
  end
end
