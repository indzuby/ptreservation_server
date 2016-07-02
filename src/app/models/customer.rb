class Customer < ActiveRecord::Base
  belongs_to :user
  belongs_to :trainer

  has_many :reservation


  attr_accessor :email,:password,:name,:sex,:tel
end
