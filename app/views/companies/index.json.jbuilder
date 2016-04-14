json.array!(@companies) do |company|
  json.extract! company, :id, :name, :tel, :address, :url
  json.link company_url(company, format: :json)
end
