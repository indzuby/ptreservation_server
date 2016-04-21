class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null:false , unique:true
      t.string :tel, null:false
      t.string :address, null:false
      t.string :url
      t.integer :is_delete, null:false, default:0

      t.timestamps null: false
    end
  end
end
