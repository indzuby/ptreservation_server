class FixColumnType < ActiveRecord::Migration
  def change
    add_index :users, :email, unique:true
    add_index :trainers, :email, unique:true
  end
end
