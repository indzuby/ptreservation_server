json.array!(@trainers) do |trainer|
  if trainer.is_delete == 0
    company_form = {company_name: trainer.company.name, company_tel: trainer.company.tel, company_address: trainer.company.address}

    json.extract! trainer, :id, :is_delete, :user_id, :company_id
    json.extract! trainer.user, :name, :tel, :sex, :email
    json.extract! company_form, :company_name
    json.url trainer_url(trainer, format: :json)
  end
end
