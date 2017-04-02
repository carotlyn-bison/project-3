class GettingTiredOfTheseDamnMigrations < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :books_id
  end
end
