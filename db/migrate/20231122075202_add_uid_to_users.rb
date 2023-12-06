class AddUidToUsers < ActiveRecord::Migration[6.0]
  def change
    create_table(:users) unless table_exists?(:users)  # テーブルが存在しない場合に作成
    add_column(:users, :uid, :string)
  end
end

