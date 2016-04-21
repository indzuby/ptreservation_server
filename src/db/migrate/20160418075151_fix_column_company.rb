class FixColumnCompany < ActiveRecord::Migration
  def change

    change_column_default :companies, :is_delete,0
  end
end
