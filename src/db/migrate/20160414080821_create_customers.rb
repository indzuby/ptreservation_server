class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :is_delete, null:false, default:0
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
