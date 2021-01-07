class Admins::RegistrationsController < Devise::RegistrationsController
  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.where('parent_id is null').order('id desc').page(params[:page]).per(10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @admins }
    end
  end

  def new
    @admin = Admin.new
    @admin.build_admin_picture
  end

  def layout
    if(['edit','update'].include?(params[:action]))
      return 'application'
    else
      return 'admin/application'
    end
  end
  
  # POST /users
  # POST /users.json
  def create
    begin
    @company = Company.create!(title: params[:title])
    @branch = Branch.create!(company_id: @company.id, title: '본점')

    ap=admin_params.merge(branch_id: @branch.id)

    @admin = Admin.new(ap)

    if Rails.env.production?
      result=verify_recaptcha(:model => @admin) && @admin.save
    else
      result=@admin.save
    end


    respond_to do |format|
      if result
        format.html { redirect_to new_admin_session_path, :notice => t(:message_success_insert)}
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end

  rescue ActiveRecord::RecordInvalid => exception
    flash[:alert]=exception.message
    redirect_to new_admin_registration_path
  end
  end

  def admin_params
    params.require(:admin).permit( :name, :email, :password, :salt, :encrypted_password, admin_picture_attributes: [:picture])
  end
end