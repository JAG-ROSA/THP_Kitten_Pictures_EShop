class OrderMailer < ApplicationMailer
  def order_confirmation(order)
    @order = order
    @user = User.find(order.cart.user_id)
    mail(to: @user.email, subject: 'Your KittenProject Order') 
  end
  def admin_confirmation(order)
    @order = order
    @user = User.find(order.cart.user_id)
    mail(to: "kittenadmin@yopmail.com", subject: 'Your KittenProject Order') 
  end
end
