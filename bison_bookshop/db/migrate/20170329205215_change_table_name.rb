class ChangeTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :users_books, :books_users
  end
end
