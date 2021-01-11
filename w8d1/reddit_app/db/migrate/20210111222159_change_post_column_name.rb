class ChangePostColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :sub_id, :sub_ids
  end
end
