class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.integer :is_delete,null:false,default:0
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
