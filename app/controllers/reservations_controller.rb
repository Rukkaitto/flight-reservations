class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show destroy ]
  before_action :authenticate_user!

  # GET /reservations or /reservations.json
  def index
    if user_signed_in?
      @reservations = current_user.reservations
    else
      redirect_back fallback_location: flights_url
    end
  end

  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @query = params[:query]
    if user_signed_in?
      @reservation = Reservation.new
    else
      redirect_back fallback_location: flights_url
    end
  end

  # POST /reservations or /reservations.json
  def create
    if user_signed_in?
      @reservation = Reservation.new(reservation_params)
      if @reservation.save
        ReservationMailer.with(user: current_user, reservation: @reservation, flight: @reservation.flight).reservation_confirmation_email.deliver_later
        redirect_to reservations_url, notice: "Thank you for booking this flight. A confirmation email has been sent to #{current_user.email}."
      else
        render :new
      end
    else
      redirect_back fallback_location: flights_url
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully cancelled." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:flight_class, :passengers_count, :user_id, :flight_id)
    end
end
