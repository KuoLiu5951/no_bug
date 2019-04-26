class CreateApplies < ActiveRecord::Migration[5.1]
  def change
    create_table :applies do |t|
      t.references :student
      t.references :project
      t.references :teacher

      t.timestamps
    end
  end
end
