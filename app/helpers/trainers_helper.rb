module TrainersHelper

  def get_company_name(id)
    Company.find(id).name
  end
end
