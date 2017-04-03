class AddNewIndex < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :books, foreign_key: true
  end
end
