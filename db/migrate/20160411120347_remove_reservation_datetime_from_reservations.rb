class RemoveReservationDatetimeFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :reservation_datetime, :timestamps
  end
end
