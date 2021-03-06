class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :items

  validates_presence_of :name
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true, on: :create
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip_code

  enum role: [:default, :merchant, :admin]

  def item_disable
    items.where(user_id: id)
        .update_all(enabled: false)
  end

  def orders
    Order.joins(:items).where("items.user_id = ?", self.id).uniq
  end
end
