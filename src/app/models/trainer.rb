class Trainer < ActiveRecord::Base
  belongs_to :user
  belongs_to :company

  has_many :customer
  has_many :reservation

  attr_accessor :email,:password,:name,:sex,:tel
end
