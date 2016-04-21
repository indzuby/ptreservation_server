class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :is_delete,null:false, default:0
      t.belongs_to :trainer, index: true, foreign_key: true
      t.belongs_to :customer, index: true, foreign_key: true
      t.timestamps :start_datetime,null:false
      t.timestamps :end_datetime,null:false

      t.timestamps null: false
    end
  end
end
