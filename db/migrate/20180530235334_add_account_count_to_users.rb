class AddAccountCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :accounts_count, :integer
  end
end
