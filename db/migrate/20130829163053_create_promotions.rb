class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :name
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.float :price, default: 0
      t.timestamps
    end
  end
end
