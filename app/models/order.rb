class Order < ApplicationRecord
  belongs_to :cart
  has_many :order_items
  has_many :items, through: :order_items
  after_create :confirmation_order

  def confirmation_order
    OrderMailer.order_confirmation(self).deliver_now
  end
end
