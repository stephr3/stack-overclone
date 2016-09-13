class Addsaltcolumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :password_salt, :salt
    rename_column :users, :password_hash, :hash
  end
end
