class ChangeHash < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :hash, :password_hash
  end
end
