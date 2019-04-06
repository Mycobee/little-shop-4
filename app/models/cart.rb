class Cart
    attr_reader :items

    def initialize(initial_contents)
         @items = initial_contents || Hash.new(0)
    end

    def total_count
        @items.values.sum
    end
    
    def add_item(id)
        @items[id.to_s] = @items[id.to_s] + 1
    end

    def count_of(id)
        @items[id.to_s].to_i
    end

    # def subtotal(item)
    #     @items[item] * item.base_price
    # end

    # def grand_total
    #     grand_total = 0
        
    #     @items.each do |item, quantity|
    #         grand_total += (item.base_price * quantity)
    #     end

    #     grand_total 
    # end
end