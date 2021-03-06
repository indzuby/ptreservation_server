class User < ActiveRecord::Base
  has_many :token
  has_many :customers
  has_many :trainers

  before_create :set_encryption


  def set_encryption
    self.password = Digest::SHA1.hexdigest(self.password)
  end

  def self.authenticate(email,password)
    usr = find_by(email: email)
    if usr != nil && usr.password == Digest::SHA1.hexdigest(password) then
      usr
    else
      return
    end
  end
end
