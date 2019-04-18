# == Schema Information
#
# Table name: students
#
#  id                :bigint(8)        not null, primary key
#  name              :string
#  phone             :string
#  sex               :integer
#  birth             :date
#  free_day          :string
#  start_free_time   :time
#  expired_free_time :time
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  email             :string
#

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
