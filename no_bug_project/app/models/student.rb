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
#  start_free_time   :datetime
#  expired_free_time :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  email             :string
#

class Student < ApplicationRecord

  belongs_to :user
  has_many :applies, dependent: :destroy
  has_many :graders, dependent: :destroy
  has_and_belongs_to_many :teachers, join_table: 'teacher_and_students'

  validates_presence_of :name, :email
  validates_uniqueness_of :email

  BOY    = 0
  GIRL   = 1
  SEX = {
    BOY    => 'boy',
    GIRL   => 'girl',
  }.freeze

  def can_select_projects
    arr = Project.pluck(:name)
    arr.uniq!
    hash = []
    arr.each do |name|
      project = Project.find_by_name(name)
      hash << {
        "id"   => project.id,
        "name" => project.name
      }
    end
    hash
  end

  def can_select_teachers
    Teacher.all
  end

end
