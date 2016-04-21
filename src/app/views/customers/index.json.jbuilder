json.array!(@customers) do |customer|
  json.extract! customer, :id, :is_delete, :user_id
  json.extract! customer.user, :name,:tel,:sex,:email
  json.url customer_url(customer, format: :json)
end
