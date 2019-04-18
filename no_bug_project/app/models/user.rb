# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_teacher             :boolean          default(FALSE)
#  is_admin               :boolean          default(FALSE)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :student, dependent: :destroy
  has_one :teacher, dependent: :destroy

  validates_presence_of :email

  after_commit :auto_create_student, on: [:create, :update]
  after_commit :auto_create_teacher, on: [:create, :update]

  def auto_create_student
    unless self.student.nil? && self.is_admin && self.is_teacher
      student = Student.find_or_initialize_by(email: self.email)
      student.user_id = self.id
      student.name = self.email
      student.save!
    end
  end

  def auto_create_teacher
    unless self.teacher.nil? && self.is_teacher
      teacher = Teacher.find_or_initialize_by(email: self.email)
      teacher.user_id = self.id
      teacher.name = self.email
      teacher.save!
    end
  end

end
