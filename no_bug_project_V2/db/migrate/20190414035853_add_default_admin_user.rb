class AddDefaultAdminUser < ActiveRecord::Migration[5.1]
  def up
    user = User.find_or_initialize_by(email: "admin@admin.com")
    user.password = "admin@admin.com"
    user.is_admin = true
    user.save!
  end
end
