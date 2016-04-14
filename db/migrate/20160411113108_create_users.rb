class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null:false
      t.string :email, null:false
      t.string :password, null:false
      t.string :tel, null:false
      t.integer :sex
      t.timestamps null: false
    end
  end
end
