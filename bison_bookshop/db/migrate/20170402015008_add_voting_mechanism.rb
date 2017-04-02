class AddVotingMechanism < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :cached_votes_total, :integer, :default => 0
    add_column :reviews, :cached_votes_score, :integer, :default => 0
    add_column :reviews, :cached_votes_up, :integer, :default => 0
    add_column :reviews, :cached_votes_down, :integer, :default => 0
    add_index :reviews, :cached_votes_total
    add_index :reviews, :cached_votes_score
    add_index :reviews, :cached_votes_up
    add_index :reviews, :cached_votes_down
  end
end
