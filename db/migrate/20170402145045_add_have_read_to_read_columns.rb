class AddHaveReadToReadColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :have_read, :boolean, :default => false
  end
end
