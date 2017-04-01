class RenameColumnsInReviews < ActiveRecord::Migration[5.0]
  def change
    rename_column :reviews, :users_id, :user_id
    rename_column :reviews, :books_id, :book_id
  end
end
