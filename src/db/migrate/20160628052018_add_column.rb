class AddColumn < ActiveRecord::Migration
  def change
    add_belongs_to :customers, :trainers
  end
end
