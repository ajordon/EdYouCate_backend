class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :update, :destroy]

  # GET /classrooms
  # GET /classrooms.json
  def index
    @classrooms = Classroom.all

    render json: @classrooms
  end

  # GET /classrooms/1
  # GET /classrooms/1.json
  def show
    render json: @classroom
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
    @classroom = Classroom.new(classroom_params)

    if @classroom.save
      render json: @classroom, status: :created, location: @classroom
    else
      render json: @classroom.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /classrooms/1
  # PATCH/PUT /classrooms/1.json
  def update
    @classroom = Classroom.find(params[:id])

    if @classroom.update(classroom_params)
      head :no_content
    else
      render json: @classroom.errors, status: :unprocessable_entity
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    @classroom.destroy

    head :no_content
  end

  private

    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    def classroom_params
      params.require(:classroom).permit(:name, :user)
    end
end
