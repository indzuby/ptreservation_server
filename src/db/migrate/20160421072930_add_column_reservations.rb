class AddColumnReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :start_datetime, :datetime
    add_column :reservations, :end_datetime, :datetime

    change_column_null :reservations, :start_datetime, false
    change_column_null :reservations, :end_datetime, false

  end
end
