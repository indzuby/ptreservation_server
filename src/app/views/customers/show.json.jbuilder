json.extract! @customer, :id, :is_delete, :created_at, :updated_at,:user_id, :pt_count
json.extract! @customer.user, :id, :name,:tel,:email,:sex
