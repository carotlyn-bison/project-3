class AddReferenceToBooks < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :users, index: true
  end
end
