class CheckoutController < ApplicationController
  def create
    @user = current_user
    @total = params[:total].to_d
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
    Cart.all.where(user_id:current_user.id).destroy_all
    Cart.create(user_id:current_user.id)
  end

  def cancel
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end
end
