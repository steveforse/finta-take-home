class CreateBankAccounts < ActiveRecord::Migration[8.1]
  def change
    create_table :bank_accounts do |t|
      t.uuid :uuid, null: false
      t.string :name
      t.string :bank_name
      t.string :account_number
      t.string :routing_number
      t.string :display_name
      t.timestamps
    end

    add_index :bank_accounts, :uuid, unique: true
    add_index :bank_accounts, :name
    add_index :bank_accounts, :bank_name
    add_index :bank_accounts, :account_number
    add_index :bank_accounts, :routing_number
  end
end
