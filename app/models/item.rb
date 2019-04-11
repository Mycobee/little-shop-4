class Item < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items
  belongs_to :user
  validates_presence_of :name
  validates_presence_of :description
  validates_numericality_of :quantity, greater_than_or_equal_to: 0
  validates_numericality_of :base_price, greater_than_or_equal_to: 0.00

  def merchant_name
   user.name
  end

  def avg_f_time
    Item.joins(:order_items)
    .where(id: self.id)
    .group(:id)
    .pluck("avg(order_items.updated_at - order_items.created_at) as avg_f_time").first
  end

  def fulfilled?
    if order_items.empty?
      false
    elsif (self.id == (order_items.first.item_id) && (order_items.first.fulfilled == true))
      true
    end
  end
end
