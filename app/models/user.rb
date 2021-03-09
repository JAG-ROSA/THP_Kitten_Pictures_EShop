class User < ApplicationRecord
  has_one :cart

  has_many :orders, through: :cart, source: :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    full_name = self.first_name + " " + self.last_name
    return full_name
  end
end
