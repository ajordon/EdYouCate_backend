class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all

    render json: @students
  end

  # GET /students/1
  # GET /students/1.json
  def show
    render json: @student
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      head :no_content
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy

    head :no_content
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :total_grade, :classroom, :comments, :user_id)
    end
end
