class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :ordered_at
      t.integer :quantity
      t.belongs_to :product
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :address
      t.timestamps
    end
    add_index :orders, :product_id
    add_index :orders, :email
    add_index :orders, :phone
  end
end
