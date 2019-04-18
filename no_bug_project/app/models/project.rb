
class Project < ApplicationRecord
  require 'csv'

  CSV.foreach("Course.csv", :headers => true) do |row|
    hash = row.to_hash.deep_stringify_keys || {}
    name = hash["name"]
    project = Project.new(name: name)
    project.day = hash["day"]
    project.start_on = hash["start_on"]
    project.finish_on = hash["finish_on"]
    project.teacher_name = hash["teacher_name"]
    if hash["teacher_name"].present?
      teacher = Teacher.find_or_initialize_by(name: hash["teacher_name"])
      if teacher.present?
        project.teacher_id = teacher.id
        user = User.find_or_initialize_by(email: "#{teacher.name}@teacher.com")
        if user.present?
          user.is_teacher = true
          user.save if user.changed?
          teacher.user_id = user.id
        end
        teacher.save if teacher.changed?
      end
    end
    project.save if project.changed?
  end

  has_one :grader, dependent: :destroy
  has_one :teacher, dependent: :destroy
  has_many :applies, dependent: :destroy
  belongs_to :teacher, optional: true

  #validates_presence_of :name
  # validates_uniqueness_of :name

  #validates_uniqueness_of :id, scope: %i[teacher_name start_on finish_on]

end
