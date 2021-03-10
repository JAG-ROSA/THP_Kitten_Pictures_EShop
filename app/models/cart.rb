class Cart < ApplicationRecord
  has_one :user
  has_many :cart_items
  has_many :items, through: :cart_items
  has_many :orders

  def total
    return self.items.pluck(:price).sum
  end
end


