class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :day
      t.time :start_on
      t.time :finish_on
      t.string :teacher_name
      t.timestamps
    end
  end
end
