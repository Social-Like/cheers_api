class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.belongs_to :category
      t.string :name
      t.text :description
      t.timestamps
    end
    add_index :brands, :category_id
  end
end
