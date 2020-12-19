class AccountsController < ApplicationController
  load_and_authorize_resource
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /Accounts
  # GET /Accounts.json
  def index
    params[:per_page] = 10 unless params[:per_page].present?

    condition={branch_id: current_admin.branch_id ,enable: true}

    if params[:product_category_id].present?
      condition[:products]={:product_category_id=>params[:product_category_id]}
    end

    if params[:product_id].present?
      condition[:products]={:id=>params[:product_id]}
    end

    @account_count = Account.joins(:accounts_products).joins(:products).where(condition).group('accounts.id').count.count
    @accounts = Account.joins(:accounts_products).joins(:products).where(condition).page(params[:page]).per(params[:per_page]).group('accounts.id').order('id desc');
  end

  # GET /Accounts/1
  # GET /Accounts/1.json
  def show
  end

  # GET /Accounts/new
  def new
    @account = Account.new
  end

  # GET /Accounts/1/edit
  def edit
  end

  # POST /Accounts
  # POST /Accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Gg was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Accounts/1
  # PATCH/PUT /Accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Accounts/1
  # DELETE /Accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def account_params
    params.require(:account).permit(:account_category_id, :user_id, :transaction_date, :cash, :credit, :point)
  end
end
