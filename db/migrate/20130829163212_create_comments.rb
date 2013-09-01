class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.datetime :commented_at
      t.string :name
      t.string :email
      t.text :comment
      t.timestamps
    end
    add_index :comments, :email
  end
end
