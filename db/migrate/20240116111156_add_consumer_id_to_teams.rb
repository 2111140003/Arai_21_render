class AddConsumerIdToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :consumer_id, :integer
    add_index :teams, :consumer_id
  end
end
