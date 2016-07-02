class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]


# date format = 'yyyy-mm-dd'

  def customer_list_date
    @reservations = Reservation.where("customer_id = ? and DATE(start_datetime) = ?", params[:customer_id], params[:date]).order("start_datetime ASC")
    render :json => @reservations, status: :ok
  end

  def customer_list_week
    time = Time.zone.parse(params[:date]+ " 00:00:00")

    startDateWeek = time.beginning_of_week
    endDateWeek = time.beginning_of_week + 7.days
    @reservations = Reservation.where("customer_id = ? and start_datetime>=? and start_datetime<?", params[:customer_id], startDateWeek, endDateWeek).order("start_datetime ASC")

    render :json => @reservations, status: :ok

  end

  def customer_list_month
    @reservations = Reservation.where("customer_id = ? and YEAR(start_datetime) = ? and MONTH(start_datetime) = ?", params[:customer_id], params[:year], params[:month]).order("start_datetime ASC")
    render :json => @reservations, status: :ok
  end


  def trainer_list_date
    @reservations = Reservation.where("trainer_id = ? and DATE(start_datetime) = ?", params[:trainer_id], params[:date]).order("start_datetime ASC")
    render :json => @reservations, status: :ok
  end

  def trainer_list_week
    time = Time.zone.parse(params[:date]+ " 00:00:00")

    startDateWeek = time.beginning_of_week
    endDateWeek = time.beginning_of_week + 7.days
    @reservations = Reservation.where("trainer_id = ? and start_datetime>=? and start_datetime<?", params[:trainer_id], startDateWeek, endDateWeek).order("start_datetime ASC")

    render :json => @reservations, status: :ok

  end

  def trainer_list_month
    @reservations = Reservation.where("trainer_id = ? and YEAR(start_datetime) = ? and MONTH(start_datetime) = ?", params[:trainer_id], params[:year], params[:month]).order("start_datetime ASC")
    render :json => @reservations, status: :ok
  end


# GET /reservations
# GET /reservations.json
  def index
    @reservations = Reservation.all
  end

# GET /reservations/1
# GET /reservations/1.json
  def show
    render :json => @reservation, :include => {:customer => {:include => :user}}, status: :ok
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
    customer = Customer.find(params[:customer_id])
    if customer.pt_count >=1
      customer.pt_count-=1
      @reservation = Reservation.new(reservation_add_params)
      @reservation.customer_id = params[:customer_id]
      @reservation.trainer_id = params[:trainer_id]
      if @reservation.save and customer.save
        render :json => @reservation, status: :created
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

# PATCH/PUT /reservations/1
# PATCH/PUT /reservations/1.json
  def update
    if @reservation.update(reservation_add_params)
      render :json => @reservation, status: :ok
    else
      render json: @reservation.errors, status: :unprocessable_entity
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
    params.require(:reservation).permit(:is_delete, :trainer_id, :customer_id, :start_datetime, :end_datetime, :memo)
  end

  def reservation_add_params
    params.require(:reservation).permit(:is_delete, :start_datetime, :end_datetime, :memo)
  end

end
