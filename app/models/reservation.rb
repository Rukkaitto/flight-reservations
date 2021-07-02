class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :flight

  before_save :ensure_flight_is_not_full, :ensure_flight_has_not_departed

  enum flight_classes: [:Eco, :Business]

  validates :flight_class, inclusion: { in: flight_classes.keys }
  validates :passengers_count, inclusion: 1..99

  private
  def ensure_flight_has_not_departed
    if DateTime.now > self.flight.departure_date
      errors.add :flight, "has already departed."
      throw :abort
    end
  end

  private
  def ensure_flight_is_not_full
    class_seats = 0
    if self.flight_class == "Eco"
      class_seats  = flight.economy_class_seats
    end
    if self.flight_class == "Business"
      class_seats  = flight.business_class_seats
    end
    if self.flight.reservations.length + 1 > class_seats
      errors.add :flight, "is full."
      throw :abort
    end
  end
end
