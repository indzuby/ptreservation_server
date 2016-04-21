class AddColumnCustomers < ActiveRecord::Migration
  def change
    change_column_null :customers, :pt_count,false
    change_column_default :customers, :pt_count,0
  end
end
