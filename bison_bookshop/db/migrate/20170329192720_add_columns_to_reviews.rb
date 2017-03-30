class AddColumnsToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :users, index: true
    add_column :reviews, :out_of_five, :integer
    add_column :reviews, :content, :text
    add_reference :reviews, :books, index:true
  end
end
