class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :caption
      t.string :image_url
      t.integer :user_id
    end
  end
end
