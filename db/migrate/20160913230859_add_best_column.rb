class AddBestColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :best, :boolean, :default => false
  end
end
