json.array!(@trainers) do |trainer|
  json.extract! trainer, :id, :is_delete, :user_id, :company_id
  json.extract! trainer.user, :name,:tel,:sex,:email
  json.url trainer_url(trainer, format: :json)
end
