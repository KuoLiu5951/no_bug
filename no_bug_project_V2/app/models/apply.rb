# == Schema Information
#
# Table name: applies
#
#  id           :bigint(8)        not null, primary key
#  student_id   :bigint(8)
#  project_id   :bigint(8)
#  teacher_id   :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  is_published :boolean          default(FALSE)
#

class Apply < ApplicationRecord

  belongs_to :student
  belongs_to :project
  belongs_to :teacher

  validates_presence_of :project_id, :teacher_id, :student_id
  validates_uniqueness_of :student_id, scope: %i[project_id teacher_id]

end
