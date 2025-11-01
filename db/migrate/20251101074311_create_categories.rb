class CreateCategories < ActiveRecord::Migration[8.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.references :category_group, foreign_key: true, null: false
      t.timestamps
    end

    add_index :categories, [:category_group_id, :name], unique: true
  end
end
