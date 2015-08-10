class GradeController < ApplicationController
  def new
    @grade = Grade.new
  end

  def show
    @grade = Grade.find(params[:id])
  end

  def create
    @grade = Grade.new(grade_params)

    if @grade.save
      Student.recalculate_average_grade(@grade.student_id)
    else
      render :new
    end
  end

  def edit
    @grade = Grade.find(params[:id])
  end

  def update
    @grade = Grade.find(params[:id])
    if @grade.update_attributes(grade_params)
      Student.recalculate_average_grade(@grade.student_id)
      flash[:success] = "Success!"
      redirect_to @grade
    else
      render 'edit'
    end
  end

  private
  def grade_params
    params.require(:grade).permit(:student_id, :discipline_id, :grade)
  end

end
      redirect_to @grade, notice: 'Successfully created'
