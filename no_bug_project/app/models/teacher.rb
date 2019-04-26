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

class Teacher < ApplicationRecord

  has_many :graders, dependent: :destroy
  has_many :projects
  has_many :students
  has_and_belongs_to_many :students, join_table: 'teacher_and_students'

  validates_presence_of :name
  validates_uniqueness_of :name

  BOY    = 0
  GIRL   = 1
  SEX = {
    BOY    => 'boy',
    GIRL   => 'girl',
  }.freeze

  def can_select_projects
    arr = self.projects.pluck(:name)
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

  def can_select_students
    Student.all
  end

end
