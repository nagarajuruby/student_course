class Course < ApplicationRecord
  #
  ## Association
  #
  has_many :student_courses
  has_many :students, through: :student_courses

  #
  ## Validation
  #
  validates :name, presence: true
end
