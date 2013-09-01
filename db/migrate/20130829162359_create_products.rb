class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category
      t.belongs_to :brand
      t.belongs_to :country
      t.string :name
      t.text :description
      t.timestamps
    end
    add_index :products, :category_id
    add_index :products, :brand_id
    add_index :products, :country_id
  end
end
