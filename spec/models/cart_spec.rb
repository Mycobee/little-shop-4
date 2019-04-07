require 'rails_helper'

 RSpec.describe Cart do
  describe 'instance methods' do
    it "#total_count" do
      cart = Cart.new({
        1 => 2,  
        2 => 3   
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

    it "#item_display" do
        cart = Cart.new({})
        item_1 = create(:item, id: 10)
        cart.add_item(item_1.id)
  
        expect(cart.item_display(item_1.id)).to eq(item_1)
    end

    it '#subtotal' do
      cart = Cart.new({})
      item_1 = create(:item, base_price: 10)
      cart.add_item(item_1.id)
      cart.add_item(item_1.id)
      expect(cart.subtotal(item_1.id)).to eq("20.00")
    end

    it '.grand_total' do
        cart = Cart.new({})
        item_1 = create(:item, base_price: 10)
        cart.add_item(item_1.id)
        cart.add_item(item_1.id)
        item_2 = create(:item, base_price: 10)
        cart.add_item(item_2.id)
        expect(cart.grand_total).to eq("30.00")
    end
   end
 end