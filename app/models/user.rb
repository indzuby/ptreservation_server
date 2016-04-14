class User < ActiveRecord::Base
  has_many :reservation
  has_many :trainer, :through => :reservation
end
