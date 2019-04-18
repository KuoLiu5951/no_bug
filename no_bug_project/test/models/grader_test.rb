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

require 'test_helper'

class GraderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
