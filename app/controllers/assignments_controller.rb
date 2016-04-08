class AssignmentsController < ApplicationController
  # before_action :set_assignment, only: [:show, :update, :destroy]
  before_action :set_students, only: [:create, :update, :destroy]
  before_action :set_classroom

  # GET /assignments
  # GET /assignments.json
  def index
    ##Show all assignements for this classroom
    @assignments = @classroom.assignments.all

    render json: @assignments
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    ##Show assignement for this classroom
    @assignment = @classroom.assignments.find(params[:id])
    render json: @assignment
  end

  # POST /assignments
  # POST /assignments.json
  def create
    ##Find all students for this classroom and give them the assignement
    # @students = set_students
    # @assignment = Assignment.new(assignment_params)
    @assignment = Assignment.new(assignment_params)
    @assignment.user = current_user
    @assignment.classroom_id = @classroom.id

    if @students.present?
      @students.assignements.new(assignment_params)

      if @assignment.save && @students.save
        render json: @assignment, status: :created
        render json: @students, status: :created
      else
        render json: @assignment.errors, status: :unprocessable_entity
        render json: @students.errors, status: :unprocessable_entity
      end
    else
      if @assignment.save
        render json: @assignment, status: :created
      else
        render json: @assignment.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    ##Update the assignment for this user and the students in the classroom
    @assignment = @classroom.assignments.find(params[:id])

    if @students.present?
      @students_assignment = @students.assignments.find(params[:id])

      if @assignment.update(assignment_params) && @students_assignment.update(assignment_params)
        head :no_content
      else
        render json: @assignment.errors, status: :unprocessable_entity
        render json: @students.errors, status: :unprocessable_entity
      end
    else
      if @assignment.update(assignment_params)
        head :no_content
      else
        render json: @assignment.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment = @classroom.assignments.find(params[:id])

    if @students.present?
      @students_assignment = @students.assignments.find(params[:id])
      @students_assignment.destroy
    end

    @assignment.destroy
    head :no_content
  end

  private
    def set_classroom
      @classroom = Classroom.find(params[:classroom_id])
    end

    def set_assignment
      @assignment = Classroom.assignments.find(params[:id])
    end

    def set_students
      @students = Classroom.find(params[:classroom_id]).students
    end

    def assignment_params
      params.require(:assignment).permit(:title, :description, :comments, :due_date)
    end
end
