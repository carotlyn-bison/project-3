class CreateUsersBooksJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users_books, id: false do |t|
      t.integer :user_id
      t.integer :book_id
  end

    add_index :users_books, :user_id
    add_index :users_books, :book_id
  end
end
