class ChangeBooksIdColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :reviews, :books_id, :book_id
    remove_foreign_key :reviews, :books
  end
end
