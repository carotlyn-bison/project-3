class DropIndex < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :book_id
  end
end
