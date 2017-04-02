class RemoveColumnFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :book_id, :integer
  end
end
