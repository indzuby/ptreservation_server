class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :trainer, :through => :reservation


  attr_accessor :email,:password,:name,:sex,:tel
end
