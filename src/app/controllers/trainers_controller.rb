class TrainersController < ApplicationController
  before_action :set_trainer, only: [:show, :edit, :update, :destroy]

  # GET /trainers
  # GET /trainers.json
  def index
    @trainers = Trainer.all
  end

  def list
    @trainers = Trainer.all
    render :json => @trainers,:include => [:company,:user] ,status: :ok
  end
  # GET /trainers/1
  # GET /trainers/1.json
  def show
    render :json => @trainer,:include => [:company,:user] ,status: :ok
    @company_form = {company_name: @trainer.company.name, company_tel: @trainer.company.tel, company_address: @trainer.company.address}
  end

  # GET /trainers/new
  def new
    @trainer = Trainer.new
    @user = User.new
  end

  # GET /trainers/1/edit
  def edit
    @trainer.name = @trainer.user.name
    @trainer.email = @trainer.user.email
    @trainer.tel = @trainer.user.tel
    @trainer.sex = @trainer.user.sex
  end

  # POST /trainers
  # POST /trainers.json
  def create

    @user = User.new(users_params)
    @user.save
    @trainer = Trainer.new(trainer_params)
    @trainer.user_id = @user.id
    @trainer.created_at = @user.created_at
    @trainer.updated_at = @user.updated_at

    respond_to do |format|
      if @trainer.save
        format.html { redirect_to '/trainers', notice: 'Trainer was successfully created.' }
        format.json { render :show, status: :created, location: @trainer }
      else
        format.html { render :new }
        format.json { render json: @trainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainers/1
  # PATCH/PUT /trainers/1.json
  def update
    trainer = Trainer.find(params[:id])
    user = User.find(trainer.user_id)
    user.name = params[:trainer][:name]
    user.email = params[:trainer][:email]
    user.tel = params[:trainer][:tel]
    user.sex = params[:trainer][:sex]
    if params[:trainer][:password].length>0
      user.password = Digest::SHA1.hexdigest(params[:trainer][:password])
    end
    respond_to do |format|
      if trainer.save and user.save
        format.html { redirect_to '/trainers', notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: trainer }
      else
        format.html { render :new }
        format.json { render json: trainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainers/1
  # DELETE /trainers/1.json
  def destroy
    if @trainer.is_delete == 1
      user_id = @trainer.user_id
      @trainer.destroy
      User.destroy(user_id)
    else
      @trainer.is_delete = 1
      @trainer.save
    end
    respond_to do |format|
      format.html { redirect_to trainers_url, notice: 'Trainer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_trainer
    @trainer = Trainer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def trainer_params
    params.require(:trainer).permit(:user_id, :company_id)
  end

  def users_params
    params.require(:trainer).permit(:email, :password, :name, :tel, :sex)
  end
end
