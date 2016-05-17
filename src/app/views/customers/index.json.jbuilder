json.array!(@customers) do |customer|

  if customer.is_delete == 0
    json.extract! customer, :id, :is_delete, :user_id
    json.extract! customer.user, :name, :tel, :sex, :email
    json.url customer_url(customer, format: :json)
  end
end
