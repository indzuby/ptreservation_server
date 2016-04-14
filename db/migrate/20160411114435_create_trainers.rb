class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :name, null:false
      t.string :email, null:false
      t.string :password, null:false
      t.string :tel, null:false
      t.integer :sex
      t.belongs_to :company, index:true
      t.timestamps null: false
    end
  end
end
