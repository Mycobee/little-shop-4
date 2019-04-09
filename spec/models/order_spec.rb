require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "Relationships" do
    it {should belong_to :user}
    it {should have_many(:items).through :order_items}
  end
  it ".sort_by_status" do
    admin = create(:admin)

    allow_any_instance_of(ApplicationController).to \
    receive(:current_user).and_return(admin)

    order_4 = create(:cancelled_order)
    order_2 = create(:packaged_order)
    order_3 = create(:shipped_order)
    order_1 = create(:order)
    @orders = Order.all
    @sorted = @orders.sort_by_status

    expect(@orders.sort_by_status).to eq(@sorted)
  end
end
