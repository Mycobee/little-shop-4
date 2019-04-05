class Item < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items
  belongs_to :user
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :image_url
  validates_presence_of :quantity
  validates_presence_of :base_price

  def merchant_name
   merchant = User.joins(:items)
                  .find_by(id: "#{self.user_id}")

   merchant.name
  end
end
