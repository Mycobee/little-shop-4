class Cart
    attr_reader :items

    def initialize
        @items = Hash.new(0)
    end

    def add_item(item)
        @items[item] += 1
    end

    def subtotal(item)
        @items[item] * item.base_price
    end

    def grand_total
        total = 0
        
        @items.each do |item, quantity|
            total += (item.base_price * quantity)
        end

        total 
    end
end