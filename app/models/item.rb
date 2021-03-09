class Item < ApplicationRecord
  has_many :cart_items
  has_many :carts, through: :cart_items

  validates :title, presence: true, length: { in: 1..100 }
  validates :description, presence: true, length: { in: 20..500 }
  validates :price, presence: true
  validates_inclusion_of :price, in: 0..1000
  validates :image_url, presence: true
end
