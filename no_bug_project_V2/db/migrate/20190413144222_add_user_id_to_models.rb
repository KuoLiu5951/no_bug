class AddUserIdToModels < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :user_id, :integer, index: true
    add_column :teachers, :user_id, :integer, index: true
  end
end
