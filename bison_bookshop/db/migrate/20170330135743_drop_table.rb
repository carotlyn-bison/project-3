class DropTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :users_books
  end
end
