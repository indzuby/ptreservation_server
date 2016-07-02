class FixColumn < ActiveRecord::Migration
  def change
    rename_column :customers, :trainers_id, :trainer_id
  end
end
