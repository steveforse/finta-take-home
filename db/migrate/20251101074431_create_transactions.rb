class CreateTransactions < ActiveRecord::Migration[8.1]
  def change
    create_table :account_transactions do |t|
      t.uuid :uuid, null: false
      t.date :date, null: false
      t.integer :amount_cents, null: false
      t.string :amount_currency, null: false
      t.string :description
      t.string :status
      t.references :category, foreign_key: true
      t.references :account, polymorphic: true, null: false
      t.jsonb :remote_data, default: {}
      t.timestamps
    end

    add_index :account_transactions, :uuid, unique: true
    add_index :account_transactions, :date
    add_index :account_transactions, :amount_cents
    add_index :account_transactions, :amount_currency
    add_index :account_transactions, :status
  end
end
