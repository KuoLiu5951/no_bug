class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :phone
      t.integer :sex
      t.date :birth
      t.string :free_day
      t.time :start_free_time
      t.time :expired_free_time

      t.timestamps
    end
  end
end
