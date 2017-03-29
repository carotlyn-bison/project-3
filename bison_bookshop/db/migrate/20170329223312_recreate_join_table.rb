class RecreateJoinTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :books_users
  end
end
