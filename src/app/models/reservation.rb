class Reservation < ActiveRecord::Base
  belongs_to :trainer
  belongs_to :customer
end
