class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :items
  has_secure_password
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip_code
  
end
