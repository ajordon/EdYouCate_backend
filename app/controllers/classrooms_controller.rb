class ClassroomsController < ProtectedController
  before_action :set_classroom, only: [:show, :update, :destroy]

  # GET /classrooms
  # GET /classrooms.json
  def index
    @classrooms = current_user.classrooms.all

    render json: @classrooms
  end

  # GET /classrooms/1
  # GET /classrooms/1.json
  def show
    @classroom = current_user.find(params[:id])
    render json: @classroom
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
    @classroom = current_user.classrooms.new(classroom_params)

    if @classroom.save
      render json: @classroom, status: :created, location: @classroom
    else
      render json: @classroom.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /classrooms/1
  # PATCH/PUT /classrooms/1.json
  def update
    @classroom = current_user.classrooms.find(params[:id])

    if @classroom.update(classroom_params)
      head :no_content
    else
      render json: @classroom.errors, status: :unprocessable_entity
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    @classroom = current_user.classrooms.find(params[:id])
    if @classroom
      @classroom.destroy
      head :no_content
    else
      render json: @classroom.errors, status: :unprocessable_entity
    end
  end

  private
    # def get_user
    #   User.find_by token: request.headers["HTTP_AUTHORIZATION"].split('=')[-1]
    # end

    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    def classroom_params
      params.require(:classroom).permit(:name)
    end
end
