class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password
  validates :email, :first_name, :last_name, :password, presence: true
end
