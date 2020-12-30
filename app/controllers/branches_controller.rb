class BranchesController < ApplicationController
  load_and_authorize_resource
  before_action :set_branch, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @branch = Branches.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @branch.update(point_params)
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
    @branch.destroy
    respond_to do |format|
      format.html { redirect_to points_url, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_branch
    @branch = Branch.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def point_params
    params.require(:branch).permit(:company_id, :enable);
  end
end
