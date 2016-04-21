class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.integer :is_delete, null:false, default:0
      t.belongs_to :user, index: true, foreign_key: true
      t.string :device_token
      t.string :access_token, index: true

      t.timestamps null: false
    end
  end
end
