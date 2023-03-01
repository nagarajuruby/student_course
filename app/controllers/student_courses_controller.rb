class StudentCoursesController < ApplicationController
  before_action :set_student_course, only: %i[ show edit update destroy ]

  def index
    @student_courses = StudentCourse.all
  end

  def show
  end

  def new
    @student_course = StudentCourse.new
  end

  def edit
  end

  def create
    @student_course = StudentCourse.new(student_course_params)

    respond_to do |format|
      if @student_course.save
        format.html { redirect_to student_course_path(@student_course), notice: "Student course was successfully created." }
        format.json { render :show, status: :created, location: @student_course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student_course.update(student_course_params)
        format.html { redirect_to student_course_path(@student_course), notice: "Student course was successfully updated." }
        format.json { render :show, status: :ok, location: @student_course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student_course.destroy

    respond_to do |format|
      format.html { redirect_to student_courses_path, notice: "Student course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_course
      @student_course = StudentCourse.find_by(id: params[:id])
      redirect_to student_courses_path if @student_course.blank?
    end

    # Only allow a list of trusted parameters through.
    def student_course_params
      params.require(:student_course).permit(:student_id, :course_id)
    end
end
