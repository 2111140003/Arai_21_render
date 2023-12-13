class CreateConsumers < ActiveRecord::Migration[7.0]
  def change
    create_table :consumers do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :consumers, :email, unique: true
  end
end
