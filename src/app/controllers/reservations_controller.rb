class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  before_action :checked_login

  before_action :get_customer, only: [:customer_list_date, :customer_list_month, :customer_list_week, :add]

  before_action :get_trainer, only: [:trainer_list_date, :trainer_list_month, :trainer_list_week]

# date format = 'yyyy-mm-dd'

  def customer_list_date
    @reservations = Reservation.where("customer_id = ? and DATE(start_datetime) = ?", @customer.id, params[:date]).order("start_datetime ASC")
    render :json => @reservations,status: :ok
  end

  def customer_list_week
    time = Time.zone.parse(params[:date]+ " 00:00:00")

    startDateWeek = time.beginning_of_week
    endDateWeek = time.beginning_of_week + 7.days
    @reservations = Reservation.where("customer_id = ? and start_datetime>=? and start_datetime<?",@customer.id,startDateWeek,endDateWeek).order("start_datetime ASC")

    render :json => @reservations,status: :ok

  end

  def customer_list_month
    @reservations = Reservation.where("customer_id = ? and YEAR(start_datetime) = ? and MONTH(start_datetime) = ?", @customer.id, params[:year], params[:month]).order("start_datetime ASC")
    render :json => @reservations,status: :ok
  end



  def trainer_list_date
    @reservations = Reservation.where("trainer_id = ? and DATE(start_datetime) = ?", @trainer.id, params[:date]).order("start_datetime ASC")
    render :json => @reservations,status: :ok
  end

  def trainer_list_week
    time = Time.zone.parse(params[:date]+ " 00:00:00")

    startDateWeek = time.beginning_of_week
    endDateWeek = time.beginning_of_week + 7.days
    @reservations = Reservation.where("trainer_id = ? and start_datetime>=? and start_datetime<?",@trainer.id,startDateWeek,endDateWeek).order("start_datetime ASC")

    render :json => @reservations,status: :ok

  end

  def trainer_list_month
    @reservations = Reservation.where("trainer_id = ? and YEAR(start_datetime) = ? and MONTH(start_datetime) = ?", @trainer.id, params[:year], params[:month]).order("start_datetime ASC")
    render :json => @reservations,status: :ok
  end


# GET /reservations
# GET /reservations.json
  def index
    @reservations = Reservation.all
  end

# GET /reservations/1
# GET /reservations/1.json
  def show
  end

# GET /reservations/new
  def new
    @reservation = Reservation.new
  end

# GET /reservations/1/edit
  def edit
  end

# POST /reservations
# POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def add
    @reservation = Reservation.new(reservation_add_params)
    @reservation.customer_id = @customer.id
    @reservation.trainer_id = params[:trainer_id]
    if @reservation.save
      render :json => @reservation, status: :created
      else
        render json: @reservation.errors, status: :unprocessable_entity
    end
  end

# PATCH/PUT /reservations/1
# PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

# DELETE /reservations/1
# DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def reservation_params
    params.require(:reservation).permit(:is_delete, :trainer_id, :customer_id, :start_datetime, :end_datetime,:memo)
  end
  def reservation_add_params
    params.require(:reservation).permit(:is_delete, :start_datetime, :end_datetime, :memo)
  end

  def get_customer
    @customer = Customer.find_by_user_id(@usr.id)
  end

  def get_trainer
    @trainer = Trainer.find_by_user_id(@usr.id)
  end

end
