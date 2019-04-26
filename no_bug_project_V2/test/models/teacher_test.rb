# == Schema Information
#
# Table name: teachers
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  phone      :string
#  sex        :integer
#  birth      :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  email      :string
#

require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
