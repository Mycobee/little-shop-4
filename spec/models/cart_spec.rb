RSpec.describe Cart do
  
  describe 'instance methods' do
    before(:each) do
      @item_1 = create(:item, base_price: 6)
      @item_2 = create(:item, base_price: 6)
      @item_3 = create(:item, base_price: 6)
      @cart = Cart.new
      @cart.add_item(@item_1)
      @cart.add_item(@item_2)
      @cart.add_item(@item_3)
      @cart.add_item(@item_3)
    end
    
    it '.add_item' do
      

      expect(@cart.items.values.sum).to eq(4)
    end

    it '.subtotal' do
        expect(@cart.subtotal(@item_3)).to eq(12)
    end

    it '.grand_total' do
        expect(@cart.grand_total).to eq(24)
    end
  end
end