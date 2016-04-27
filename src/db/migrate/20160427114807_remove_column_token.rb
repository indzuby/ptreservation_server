class RemoveColumnToken < ActiveRecord::Migration
  def change
    remove_column :tokens, :access_token
    add_column :reservations, :memo, :string
  end
end
