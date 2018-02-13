class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :comment_text
      t.integer :user_id
      t.integer :photo_id
    end
  end
end
