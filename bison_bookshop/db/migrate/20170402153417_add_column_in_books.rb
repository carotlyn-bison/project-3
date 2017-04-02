class AddColumnInBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :read, :boolean, :default => false
  end
end
