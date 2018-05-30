class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :amount
      t.string :transaction_type
      t.integer :category_id
      t.datetime :date
      t.string :description
      t.integer :account_id
      t.integer :tagging_id

      t.timestamps

    end
  end
end
