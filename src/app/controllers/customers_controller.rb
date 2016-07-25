class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :destroy]
  # before_action :checked_login


  def get_customer_by_trainer
    @customers = Customer.where("trainer_id = ?",params[:trainer_id]).order(:pt_count => "desc")
    render :json => @customers,:include => :user ,status: :ok
  end

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customers = Customer.find(params[:id])
    render :json => @customers,:include => [:user ,:trainer => {:include => :user}] ,status: :ok
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
    @customer.name = @customer.user.name
    @customer.email = @customer.user.email
    @customer.tel = @customer.user.tel
    @customer.sex = @customer.user.sex
  end

  # POST /customers
  # POST /customers.json
  def create

    @user = User.new(users_params)
    @user.save
    @customer = Customer.new(customer_params)
    @customer.trainer_id = params[:customer][:trainer_id]
    @customer.user_id = @user.id
    @customer.created_at = @user.created_at
    @customer.updated_at = @user.updated_at

    respond_to do |format|
      if @customer.save
        format.html { redirect_to '/customers', notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    customer = Customer.find(params[:id])
    user = User.find(customer.user_id)
    user.name = params[:customer][:name]
    user.email = params[:customer][:email]
    user.tel = params[:customer][:tel]
    user.sex = params[:customer][:sex]
    if params[:customer][:password].length>0
      user.password = Digest::SHA1.hexdigest(params[:customer][:password])
    end
    customer.trainer_id = params[:customer][:trainer_id]
    customer.pt_count = params[:customer][:pt_count]
    respond_to do |format|
      if customer.save and user.save
        format.html { redirect_to '/customers', notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: customer }
      else
        format.html { render :new }
        format.json { render json: customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    if @customer.is_delete == 1
      user_id = @customer.user_id
      @customer.destroy
      User.destroy(user_id)
    else
      @customer.is_delete = 1
      @customer.save
    end
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
    @user = User.find(@customer.user_id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_params
    params.require(:customer).permit(:user_id, :is_delete, :pt_count)
  end

  def users_params
    params.require(:customer).permit(:email, :password, :name, :tel, :sex)
  end
end
