json.array!(@users) do |user|
  json.extract! user, :id,:email,:name, :tel
  json.link user_url(user, format: :json)
end
