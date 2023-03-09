class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.references :category
      t.datetime :release_date
      t.string :language

      t.timestamps
    end
  end
end
