class Cart
    attr_reader :items

    def initialize(initial_contents)
        @items = initial_contents || {}
    end

    def add_item(item)
        @items[item] += 1
    end

    def subtotal(item)
        @items[item] * item.base_price
    end

    def grand_total
        grand_total = 0
        
        @items.each do |item, quantity|
            grand_total += (item.base_price * quantity)
        end

        grand_total 
    end
end