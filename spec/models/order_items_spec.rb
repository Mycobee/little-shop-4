require 'rails_helper'


RSpec.describe OrderItem, type: :model do
  describe "Relationship" do
    it {should belong_to :item}
  end

  describe "Validations" do
    it {should validate_presence_of :price}
    it {should validate_presence_of :quantity}
  end
  it '.total_quantity' do
    merchant = create(:merchant)
    allow_any_instance_of(ApplicationController).to \
    receive(:current_user).and_return(merchant)

    order = create(:order)

    item_1 = create(:item, user: merchant)
    item_2 = create(:item, user: merchant)
    item_3 = create(:item, user: merchant)
    item_4 = create(:item)
    item_5 = create(:item)

    order_item_1 = create(:order_item, item: item_1, order: order, quantity: 5)
    order_item_2 = create(:order_item, item: item_1, order: order, quantity: 5)
    order_item_3 = create(:order_item, item: item_2, order: order, quantity: 3)
    order_item_4 = create(:order_item, item: item_2, order: order, quantity: 3)
    order_item_5 = create(:order_item, item: item_3, order: order, quantity: 7)
    order_item_6 = create(:order_item, item: item_3, order: order, quantity: 7)
    order_item_4 = create(:order_item, item: item_4, order: order, quantity: 9)
    order_item_5 = create(:order_item, item: item_5, order: order, quantity: 6)

    actual = item_1.order_items.item_quantity
    expected = 10

    expect(actual).to eq(expected)

    actual = item_2.order_items.item_quantity
    expected = 6

    expect(actual).to eq(expected)

    actual = item_3.order_items.item_quantity
    expected = 14

    expect(actual).to eq(expected)
  end
end
