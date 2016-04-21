json.array!(@tokens) do |token|
  json.extract! token, :id, :is_delete, :user_id, :device_token, :access_token
  json.url token_url(token, format: :json)
end
