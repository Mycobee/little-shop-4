class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  def total_items
    order_items.sum(:quantity)
  end

  def total_value
    order_items.sum("quantity * price")
  end
end
