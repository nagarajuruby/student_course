class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  def index

    @record_filter = Student.ransack(params[:search])
    @students = @record_filter.result(distinct: true)

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "test", template: "/students/student_list.html.erb", formats: [:html], layout: "pdf"
      end
      format.xls do
        render xls: "test", template: "/students/student_list.html.erb", formats: [:html], layout: "pdf"
      end
    end
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to student_path(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_path(@student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_path, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find_by(id: params[:id])
      redirect_to students_path if @student.blank?
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :perent_mobile, :mobile, :city)
    end
end
