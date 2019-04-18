# == Schema Information
#
# Table name: graders
#
#  id           :bigint(8)        not null, primary key
#  student_id   :bigint(8)
#  project_id   :bigint(8)
#  teacher_id   :bigint(8)
#  is_published :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Grader < ApplicationRecord

  belongs_to :student
  belongs_to :project
  belongs_to :teacher

  validates_presence_of :project_id, :teacher_id, :student_id
  validates_uniqueness_of :project_id, scope: %i[student_id teacher_id]

end
