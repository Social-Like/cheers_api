class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.belongs_to :attachmentable, polymorphic: true
      t.attachment :asset
      t.integer :priority, default: 0
      t.timestamps
    end
    add_index :attachments, [:attachmentable_id, :attachmentable_type]
  end
end
