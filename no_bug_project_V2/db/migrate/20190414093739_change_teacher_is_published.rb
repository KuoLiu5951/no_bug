class ChangeTeacherIsPublished < ActiveRecord::Migration[5.1]
  def change
    change_column :graders, :is_published, :boolean, default: false
  end
end
