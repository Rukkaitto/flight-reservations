prawn_document do |pdf|
  pdf.text "This is your ticket for the flight from #{@reservation.flight.departure_airport} to #{@reservation.flight.arrival_airport}."
  pdf.text "This flight will be departing at #{@reservation.flight.departure_date.strftime('%H:%M')} on #{@reservation.flight.departure_date.strftime('%b. %e, %Y')}."
end
