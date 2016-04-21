json.extract! @trainer, :id, :is_delete, :user_id, :company_id, :created_at, :updated_at
json.extract! @trainer.user, :name,:tel,:sex,:email
json.extract! @company_form, :company_name, :company_tel, :company_address
