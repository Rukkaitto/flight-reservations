class FlightsController < ApplicationController
  before_action :set_flight, only: %i[ show  ]

  # GET /flights or /flights.json
  def index
    @flights = Flight.page(params[:page]);
  end

  # GET /flights/1 or /flights/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      params.require(:flight).permit(:number, :departure_airport, :arrival_airport, :departure_date, :duration, :business_class_seats, :economy_class_seats, :page)
    end
end
