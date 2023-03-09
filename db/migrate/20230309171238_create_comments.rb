class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :book
      t.text :comment_text
    end
  end
end
