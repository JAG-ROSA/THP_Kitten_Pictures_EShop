class Order < ApplicationRecord
  belongs_to :cart
  has_many :order_items
  has_many :items, through: :order_items
  after_create :customer_confirmation, :admin_confirmation

  def customer_confirmation
    OrderMailer.order_confirmation(self).deliver_now
  end

  def admin_confirmation
    OrderMailer.admin_confirmation(self).deliver_now
  end
end
