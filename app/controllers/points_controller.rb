class PointsController < ApplicationController
  load_and_authorize_resource
  before_action :set_point, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    params[:per_page] = 10 unless params[:per_page].present?

    condition={users: {branch_id: current_admin.branch_id} ,enable: true}

    @point_count = Point.joins(:user).where(condition).count
    @points = Point.joins(:user).where(condition).page(params[:page]).per(params[:per_page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @point = Point.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @point = Point.new(point_params)

    respond_to do |format|
      if @point.save
        format.html { redirect_to @point, notice: 'Gg was successfully created.' }
        format.json { render :show, status: :created, location: @point }
      else
        format.html { render :new }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @point.update(point_params)
        format.html { redirect_to @point, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @point }
      else
        format.html { render :edit }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @point.destroy
    respond_to do |format|
      format.html { redirect_to points_url, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_point
    @point = Point.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def point_params
    params.require(:point).permit(:user_id, :point, :enable);
  end
end
