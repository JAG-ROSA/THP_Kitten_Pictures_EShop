class ApplicationController < ActionController::Base
  include CategoriesHelper

  before_action :current_cart

  private
    def current_cart
      if session[:cart_id]
        cart = Cart.find_by(id: session[:cart_id])
        @cart_items = CartItem.where(cart_id: session[:cart_id])
        if user_signed_in?
          cart.update(user_id: current_user.id)
        end
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
      end

      if session[:cart_id] == nil
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end

end
