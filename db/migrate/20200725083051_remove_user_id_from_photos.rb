class RemoveUserIdFromPhotos < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :user_id, :string
  end
end
