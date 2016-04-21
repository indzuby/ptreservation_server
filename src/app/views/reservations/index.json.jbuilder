json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :is_delete, :trainer_id, :customer_id, :start_datetime, :end_datetime
  json.url reservation_url(reservation, format: :json)
end
