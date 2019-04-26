class ChangeUserIsAdmin < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :is_teacher, :boolean, default: false
    change_column :users, :is_admin, :boolean, default: false
  end
end
