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

require 'test_helper'

class ApplyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
