class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title, null: false
      t.string :image_id
      t.text :body, null: false
      t.string :objective
      t.string :review

      t.timestamps
    end
  end
end
