# == Schema Information
#
# Table name: teacher_and_students
#
#  id         :bigint(8)        not null, primary key
#  teacher_id :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TeacherAndStudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
