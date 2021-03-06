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
    elsif order_items.each do |order_item|
      order_item.fulfilled? == false
    end
    false
    end
  end

  def self.top_five
    Item.joins(:order_items).select("items.*, sum(order_items.quantity) as total_quantity")
    .where("order_items.fulfilled = true")
    .group(:id)
    .order("total_quantity DESC")
    .limit(5)
  end

  def self.bottom_five
    Item.joins(:order_items).select("items.*, sum(order_items.quantity) as total_quantity")
    .where("order_items.fulfilled = true")
    .group(:id)
    .order("total_quantity ASC")
    .limit(5)
  end

  def quantity_bought
    order_items.sum(:quantity)
  end

end
