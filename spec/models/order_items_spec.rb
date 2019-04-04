require 'rails_helper'


RSpec.describe OrderItem, type: :model do
  describe "Relationship" do
    it {should belong_to :item}
  end

  describe "Validations" do
    xit {should validate_presence_of :price}
    xit {should validate_presence_of :quantity}
  end
end
