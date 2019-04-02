class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  validates_presence_of :order_price
  validates_presence_of :quantity
  validates_presence_of :fulfilled
end
