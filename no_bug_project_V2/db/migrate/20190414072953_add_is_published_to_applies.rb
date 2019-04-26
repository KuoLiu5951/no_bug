class AddIsPublishedToApplies < ActiveRecord::Migration[5.1]
  def change
    add_column :applies, :is_published, :boolean, :default => false
  end
end
