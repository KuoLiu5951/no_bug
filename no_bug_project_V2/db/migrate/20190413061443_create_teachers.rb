class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :phone
      t.integer :sex
      t.date :birth

      t.timestamps
    end
  end
end
