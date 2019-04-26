class CreateTeacherAndStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_and_students do |t|
      t.integer :teacher_id, index: true
      t.integer :student_id, index: true
      t.timestamps
    end
  end
end
