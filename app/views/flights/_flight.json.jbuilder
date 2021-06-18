json.extract! flight, :id, :number, :departure_airport, :arrival_airport, :departure_datetime, :arrival_datetime, :max_eco_seats, :max_business_seats, :created_at, :updated_at
json.url flight_url(flight, format: :json)
