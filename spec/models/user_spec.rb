require 'rails_require'

RSpec.describe User, type: :model do
  describe "Relationship" do
    it {should have_many :items}
    it {should have_many :orders}
    #verify that users don't need items through order_items
  end

  describe "Validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :email}
    it {should validate_presence_of :password_digest}
    it {should validate_presence_of :address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip_code}
    it {should validate_presence_of :role}
    it {should validate_presence_of :enabled}
  end
end
