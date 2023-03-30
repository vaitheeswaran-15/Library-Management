class CreateJoinTabeleStudentBookReadStatus < ActiveRecord::Migration[6.1]
  def change
    create_join_table :students, :books, table_name: :book_read_status do |t|
      t.index [:student_id, :book_id]
    end
  end
end
