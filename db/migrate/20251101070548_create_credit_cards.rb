class CreateCreditCards < ActiveRecord::Migration[8.1]
  def change
    create_table :credit_cards do |t|
      t.uuid :uuid, null: false
      t.string :name
      t.string :last_4
      t.string :brand
      t.integer :expiration_month
      t.integer :expiration_year
      t.timestamps
    end

    add_index :credit_cards, :uuid, unique: true
    add_index :credit_cards, :name
    add_index :credit_cards, :last_4
    add_index :credit_cards, :brand
    add_index :credit_cards, :expiration_month
    add_index :credit_cards, :expiration_year
  end
end
