class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|

      t.belongs_to :user,index:true
      t.belongs_to :tranier,index:true
      t.timestamps :reservation_datetime
      t.timestamps null: false
    end
  end
end
