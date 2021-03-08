class OrderMailer < ApplicationMailer
  def order_confirmation(order)
    @order = order
    @user = order.user #à voir correspondance avec la table Order quand elle sera créée
    mail(to: @user.email, subject: 'Your KittenProject Order') 
  end
end
