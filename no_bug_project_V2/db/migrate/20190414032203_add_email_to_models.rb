class AddEmailToModels < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :email, :string
    add_column :students, :email, :string
  end
end
