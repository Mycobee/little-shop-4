class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  enum status: [:packaged, :pending, :shipped, :cancelled]

  def total_items
    order_items.sum(:quantity)
  end

  def total_value
    order_items.sum("quantity * price")
  end

  def self.sort_by_status
    Order.order(status: :asc)
  end

  def grand_total
    binding.pry
    items
  end
end

# Order.select("date(created_at) as ordered_date, sum(price) as total_price").group("date(created_at)")
