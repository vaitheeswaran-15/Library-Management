class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :category_code
      t.text :description

      t.timestamps
    end
  end
end
