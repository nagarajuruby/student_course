module ApplicationHelper

  def student_list
    Student.pluck(:name, :id)
  end

  def course_list
    Course.pluck(:name, :id)
  end
end
