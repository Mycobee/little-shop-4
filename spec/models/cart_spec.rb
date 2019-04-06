require 'rails_helper'

 RSpec.describe Cart do
  describe 'instance methods' do
#     before(:each) do
#       @item_1 = create(:item, base_price: 6)
#       @item_2 = create(:item, base_price: 6)
#       @item_3 = create(:item, base_price: 6)
#       @cart = Cart.new
#       @cart.add_item(@item_1)
#       @cart.add_item(@item_2)
#       @cart.add_item(@item_3)
#       @cart.add_item(@item_3)
#     end
    
    it "#total_count" do
      cart = Cart.new({
        1 => 2,  # two copies of song 1
        2 => 3   # three copies of song 2
      })
      expect(cart.total_count).to eq(5)
    end
#     
    it '#add_item' do
      cart = Cart.new({
        '1' => 2,  
        '2' => 3   
      })
      
      cart.add_item(1)
      cart.add_item(2)

      expect(cart.items).to eq({'1' => 3, '2' => 4})
    end

    it '#count_of' do
      cart = Cart.new({})

      expect(cart.count_of(5)).to eq(0)
    end

#     it '.subtotal' do
#         expect(@cart.subtotal(@item_3)).to eq(12)
#     end

#     it '.grand_total' do
#         expect(@cart.grand_total).to eq(24)
#     end
   end
 end