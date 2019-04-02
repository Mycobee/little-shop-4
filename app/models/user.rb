class User < ApplicationRecord
  has_many :orders
  has_many :items
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :password_digest
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip_code
  validates_presence_of :role
  validates_presence_of :enabled
end
