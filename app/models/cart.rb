class Cart


    attr_reader :items

    def initialize(initial_contents)
         @items = initial_contents || Hash.new(0)

        @items.default = 0
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

    def item_display(id)
        Item.where(id: "#{id}").first
    end

    def subtotal(id)
        subtotal = @items[id.to_s].to_f * item_display(id).base_price
        "%5.2f" %subtotal
    end

    def grand_total

         grand_total = 0

        @items.each do |id, quantity|
            grand_total += (item_display(id).base_price * quantity)
        end

        "%5.2f" %grand_total
    end

    def delete_item(delete_item)
      self.items.each do |item|
        if item[0].to_i == delete_item.id
          self.items.delete(delete_item.id.to_s)
        end
      end
    end
end
