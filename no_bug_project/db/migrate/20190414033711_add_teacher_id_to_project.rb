class AddTeacherIdToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :teacher_id, :integer, index: true
  end
end
