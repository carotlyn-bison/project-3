class OneMoreTimeAgain < ActiveRecord::Migration[5.0]
  def change
    create_join_table :books, :users do |t|
      t.index :book_id
      t.index :user_id
    end
  end
end
