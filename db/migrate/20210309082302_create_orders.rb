class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :cart
      t.float :amount, null: false
      t.string :payment_status, null: false, default: "pending"
      t.timestamps
    end
  end
end
