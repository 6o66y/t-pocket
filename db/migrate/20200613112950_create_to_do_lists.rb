class CreateToDoLists < ActiveRecord::Migration[5.2]
  def change
    create_table :to_do_lists do |t|
      t.references :user, foreign_key: true
      t.string :to_do

      t.timestamps
    end
  end
end
