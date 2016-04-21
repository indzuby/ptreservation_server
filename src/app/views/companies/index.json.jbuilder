json.array!(@companies) do |company|
  json.extract! company, :id, :name, :tel, :address, :url, :is_delete
  json.url company_url(company, format: :json)
end
