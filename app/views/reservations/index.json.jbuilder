json.array!(@reservations) do |reservation|
  json.extract! reservation, :id
  json.link reservation_url(reservation, format: :json)
end
