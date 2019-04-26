# == Schema Information
#
# Table name: projects
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  start_on   :time
#  expired_on :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  teacher_id :integer
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
