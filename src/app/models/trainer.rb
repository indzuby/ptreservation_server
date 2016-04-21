class Trainer < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  has_many :reservations
  has_many :customer, :through => :reservation

  attr_accessor :email,:password,:name,:sex,:tel
end
