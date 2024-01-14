class AddTeamToTasks < ActiveRecord::Migration[7.0]
  def change
    # 既に存在する場合は追加しないようにする
    unless column_exists?(:tasks, :team_id)
      add_reference :tasks, :team, null: false, foreign_key: true
    end
  end
end
