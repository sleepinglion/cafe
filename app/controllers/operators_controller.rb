class OperatorsController < ApplicationController
  load_and_authorize_resource
  before_action :set_operator, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    params[:per_page] = 10 unless params[:per_page].present?

    condition={branch_id: current_admin.branch_id }

    @operator_count = Operator.where(condition).count
    @operators = Operator.where(condition).page(params[:page]).per(params[:per_page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @operator = Operator.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @operator = Operator.new(operator_params)

    respond_to do |format|
      if @operator.save
        format.html { redirect_to @operator, notice: 'operator was successfully created.' }
        format.json { render :show, status: :created, location: @operator }
      else
        format.html { render :new }
        format.json { render json: @operator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @operator.update(operator_params)
        format.html { redirect_to @operator, notice: 'operator was successfully updated.' }
        format.json { render :show, status: :ok, location: @operator }
      else
        format.html { render :edit }
        format.json { render json: @operator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @operator.destroy
    respond_to do |format|
      format.html { redirect_to operators_url, notice: 'operator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_operator
    @operator = Operator.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def operator_params
    params.require(:operator).permit(:name, :email, :enable);
  end
end
