class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string  :name
      t.string  :tel
      t.integer :sex
      t.integer :isDelete

      t.timestamps null: false
    end
  end
end
