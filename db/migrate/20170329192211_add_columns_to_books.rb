class AddColumnsToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :title, :string
    add_column :books, :author, :string
    add_column :books, :buy_link, :string
    add_column :books, :description, :text
    add_column :books, :image, :string
  end
end
