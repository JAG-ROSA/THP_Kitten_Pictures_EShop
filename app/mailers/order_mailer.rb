class OrderMailer < ApplicationMailer
  def order_confirmation(order)
    @order = order
    @user = User.find(order.cart.user_id)
    @order.cart.items.each do |item|
      attachments.inline[item.image.filename.to_s] = File.read(Rails.root.join("app/assets/images/kitten_pictures/#{item.image.filename.to_s}"))
    end
    mail(to: @user.email, subject: 'Your KittenProject Order') 
  end
  def admin_confirmation(order)
    @order = order
    @user = User.find(order.cart.user_id)
    mail(to: "kittenadmin@yopmail.com", subject: 'Your KittenProject Order') 
  end
end
