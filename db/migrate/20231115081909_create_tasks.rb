class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.integer :task_id
      t.string :task_name
      t.string :task_det
      t.boolean :task_com

      t.timestamps
    end
  end
end
