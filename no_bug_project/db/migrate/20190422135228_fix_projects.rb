class FixProjects < ActiveRecord::Migration[5.1]
  def up
    Project.where(teacher_id: nil).destroy_all
  end
end
