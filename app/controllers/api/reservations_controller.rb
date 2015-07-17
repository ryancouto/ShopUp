class Api::ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = current_user.requested_reservations.new
  end

  def create
    @reservation = current_user.requested_reservations.new(reserv_params)
    if @reservation.save
      render json: @reservation
    else
      render json: @reservation.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
    @reservation = current_user.pending_reservations.find(params[:id])
    if !@reservation
      shops = Shop.all
      render json: shops
    end
  end

  def update
    @reservation = current_user.pending_reservations.find(params[:id])
    if @reservation
      if @reservation.update(reserv_params)
        render json: @reservation
      else
        render json: @reservation.errors.full_messages, status: :unprocessable_entity
      end
    else
      render json: @reservation
    end
  end

  def show
    @reservation = current_user.pending_reservations.find(params[:id])
    @reservation ||= current_user.requested_reservations.find(params[:id])
  end

  def destroy
    @reservation = current_user.pending_reservations.find(params[:id])
    if @reservation
      @reservation.destroy
      redirect_to user_url(current_user.id)
    else
      shops = Shop.all
      render json: shops
    end
  end

  private
  def reserv_params
    params.require(:reservation).permit(:shop_id, :start_day, :end_day, :approved?, :owner_id, :renter_id, :approved)
  end
end
