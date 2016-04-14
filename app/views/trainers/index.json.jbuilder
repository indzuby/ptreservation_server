json.array!(@trainers) do |trainer|
  json.extract! trainer, :id,:email,:name,:company_id, :tel
  json.link trainer_url(trainer, format: :json)
end
