class CreateCategoryGroups < ActiveRecord::Migration[8.1]
  def change
    create_table :category_groups do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :category_groups, :name, unique: true
  end
end
