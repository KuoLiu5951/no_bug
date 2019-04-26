class CreateGraders < ActiveRecord::Migration[5.1]
  def change
    create_table :graders do |t|
      t.references :student
      t.references :project
      t.references :teacher
      t.boolean :is_published

      t.timestamps
    end
  end
end
