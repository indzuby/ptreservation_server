class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null:false
      t.string :tel, null:false
      t.string :address, null:false
      t.string :url
      t.timestamps null: false
    end
  end
end
