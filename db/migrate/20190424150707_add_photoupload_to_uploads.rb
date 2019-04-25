class AddPhotouploadToUploads < ActiveRecord::Migration[5.2]
  def change
    add_column :uploads, :photoupload, :string
  end
end
