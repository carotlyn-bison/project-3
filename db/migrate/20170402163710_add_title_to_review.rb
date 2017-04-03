class AddTitleToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :book_title, :string
  end
end
