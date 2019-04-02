class Order < ApplicationRecord
  belong_to :user
  has_many :order_items
  has_many :items through: :order_items
  validates_presence_of :status

end
