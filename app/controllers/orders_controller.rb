class OrdersController < ApplicationController
  load_and_authorize_resource
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    params[:per_page] = 10 unless params[:per_page].present?

    condition = { branch_id: current_admin.branch_id, enable: true }
    condition_sql='1=1'
    sql_params=[]

    if params[:start_date].present?
      condition_sql+=" AND transaction_date>=?"
      sql_params << params[:start_date].to_date
    end

    if params[:end_date].present?
      condition_sql+=" AND transaction_date<=?"
      sql_params << params[:end_date].to_date
    end

    @order_count = Order.where(condition).where(condition_sql,*sql_params).count()
    @orders = Order.where(condition).where(condition_sql,*sql_params).page(params[:page]).per(params[:per_page]).order('id desc');
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    params[:per_page] = 10 unless params[:per_page].present?

    @order = Order.new
    @order.orders_products.build

    condition={ branch_id: current_admin.branch_id, display: true, enable: true }

    @product_categories = ProductCategory.where(condition)

    if params[:product_category]
      @product_category = ProductCategory.find(params[:product_category])
    else
      unless @product_categories.empty?
        @product_category = @product_categories.first
      end
    end

    if params[:search_type] and params[:search_word]
      if ['name', 'phone', 'access_card'].include?(params[:search_type])
        @users = User.where(condition).where("#{params[:search_type]} like ?", "%#{params[:search_word]}%")

        if @users.count == 1
          @user = @users[0];
        end
      end
    end

    if @product_category.present?
      condition[:product_category_id]=@product_category.id
    else
      condition[:product_category_id]=nil
    end

    @products = Product.where(condition).order('id desc').page(params[:page]).per(params[:per_page])

    @payment_count = Payment.joins(:branches_payments).where({:branches_payments=>{ branch_id: current_admin.branch_id,enable: true}, enable: true}).count
    @payments = Payment.joins(:branches_payments).where({:branches_payments=>{ branch_id: current_admin.branch_id,enable: true}, enable: true})
  end

  # GET /orders/1/edit
  def edit
  end

  def calculate_account(s, payment_method)
    a = { total_price: 0 }
    if s.empty?
      return a
    end

    s.each do |ss|
      pp = ss.price * ss.quantity

      a[:total_price]+=pp
    end

    return a
  end

  # POST /orders
  # POST /orders.json
  def create
    result = false

    begin

    @order = Order.new(order_params)
    @order.save!

    OrdersAdmin.create!(:order_id=>@order.id,:admin_id=>current_admin.id)

    ca = calculate_account(@order.orders_products,params[:payment_method])
    account = Account.create!(order_params.merge(:account_category_id=>1).except(:orders_products_attributes))

    @order.orders_products.each do |order_product|
      @accounts_product=AccountsProduct.create!(:account_id=>account.id, :product_id=>order_product.product_id)
    end

    @accounts_order = AccountsOrder.create!(:account_id => account.id, :order_id => @order.id)
    AccountsPayment.create!(:account_id => account.id, :payment_id=>params[:payment_method])
    @order.update(total_price: ca[:total_price], total_payment: ca[:total_price])
    result = true

    respond_to do |format|
      if result
        format.html { redirect_to new_order_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end

    rescue ActiveRecord::RecordInvalid => exception
      flash[:alert]=exception.message
      redirect_to new_order_path
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:user_id, :transaction_date, :price, :discount, :payment, orders_products_attributes: [:id, :product_id, :price, :quantity]).merge(branch_id: current_admin.branch_id)
  end
end
