class RenameColumnInBooks < ActiveRecord::Migration[5.0]
  def change
    rename_column :books, :users_id, :user_id
  end
end
