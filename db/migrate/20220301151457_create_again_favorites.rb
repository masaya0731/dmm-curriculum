class CreateAgainFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :again_favorites do |t|
      t.integer :user_id
      t.integer :again_book_id

      t.timestamps
    end
  end
end
