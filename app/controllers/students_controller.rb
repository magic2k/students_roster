class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]


  def index
    @students = Student.all
  end

  def show
#    @avr_grade = Grade.where(student_id: params[:id]).average(:grade).truncate(2).to_s
    @characteristic = LeadCharacteristicOfStudent.where(student_id: params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)

      if @student.save
        redirect_to @student, notice: 'Student was successfully created.'
      else
        render :new
      end
  end


  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  rescue ActiveRecord::StaleObjectError
    flash[:error] = "Dirty read error. Student entry was modified while you were editing."
    redirect_to :edit
  end

  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :birth_date, :email, :ip_address, :group_id, :registered_at, :average_grade)
    end
end
