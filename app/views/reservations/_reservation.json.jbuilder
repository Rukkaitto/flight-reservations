json.extract! reservation, :id, :flight_class, :passengers_count, :user_id, :flight_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
