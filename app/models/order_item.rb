class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  validates_presence_of :price
  validates_presence_of :quantity

  def self.item_quantity
    sum(:quantity)
  end
end
