class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :user_id
      t.text :embended_html
      t.string :caption

      t.timestamps
    end
  end
end
