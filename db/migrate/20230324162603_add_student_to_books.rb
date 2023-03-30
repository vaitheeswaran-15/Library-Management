class AddStudentToBooks < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :student
  end
end
