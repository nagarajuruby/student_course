class Student < ApplicationRecord
  #
  ## Association
  #
  has_many :student_courses
  has_many :courses, through: :student_courses

  #
  ## Validation
  #
  validates :name, :city, presence: true
  validates :perent_mobile, presence: true, numericality: true, length: { minimum: 10, maximum: 10 }
  validates :mobile, presence: true, numericality: true, length: { minimum: 10, maximum: 10 }
end
