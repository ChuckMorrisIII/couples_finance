class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :account_type
      t.integer :owner_id
      t.string :account_subtype
      t.integer :joint_owner_id

      t.timestamps

    end
  end
end
