class FixColumnUsers < ActiveRecord::Migration
  def change
    change_column_null :users, :email,false
    change_column_null :users, :password,false
    change_column_null :users, :name,false
    change_column_null :users, :sex,false
    change_column_null :users, :isDelete,false

    change_column_default :users, :isDelete,0

    add_index :users, :email, :unique =>  false
  end
end
