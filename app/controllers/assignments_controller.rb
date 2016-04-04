class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :update, :destroy]

  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.all

    render json: @assignments
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    render json: @assignment
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)

    if @assignment.save
      render json: @assignment, status: :created, location: @assignment
    else
      render json: @assignment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    @assignment = Assignment.find(params[:id])

    if @assignment.update(assignment_params)
      head :no_content
    else
      render json: @assignment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy

    head :no_content
  end

  private

    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def assignment_params
      params.require(:assignment).permit(:title, :description, :comments, :grade, :due_date, :student)
    end
end
