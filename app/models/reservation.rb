class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :flight

  enum flight_classes: [:Eco, :Business]

  validates :flight_class, inclusion: { in: flight_classes.keys }
  validates :passengers_count, inclusion: 1..99
end
