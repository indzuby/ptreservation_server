class AddStartDatetimeToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :start_datetime, :timestamps
    add_column :reservations, :end_datetime, :timestamps
  end
end
