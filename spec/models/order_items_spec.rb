require 'rails_helper'


RSpec.describe OrderItem, type: :model do
  describe "Relationship" do
    it {should belong_to :item}
  end

  describe "Validations" do
    it {should validate_presence_of :price}
    it {should validate_presence_of :quantity}
    it {should validate_presence_of :fulfilled}
  end
end
