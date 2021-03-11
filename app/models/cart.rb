class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_items
  has_many :items, through: :order_items
  has_many :cart_items, -> { order(:created_at) }
  has_many :items, through: :cart_items

  def total
    sum = 0
    self.cart_items.each do |cart_item|
      sum += cart_item.total_price
    end
    return sum
  end
end
