class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.integer :team_id
      t.string :team_name

      t.timestamps
    end
  end
end
