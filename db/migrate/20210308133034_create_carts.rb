class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.belongs_to :user, index: true
      t.string :status, null: false, default: "inactive"
      t.timestamps
    end
  end
end
