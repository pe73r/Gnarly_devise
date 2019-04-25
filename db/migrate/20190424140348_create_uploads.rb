class CreateUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :uploads do |t|
      t.string :title
      t.text :description
      t.boolean :is_public, default: true
      t.references :user, foreign_key: true
      t.attachment :file_upload
      t.timestamps
    end
  end
end
