# class Inventory
  class Bag
    attr_reader :item_name, :item_type

    def initialize (item_name, item_type)
      @item_name = item_name
      @item_type = item_type
    end

    def ==(other)
      self.class === other and
        other.item_name = @item_name and
        other.item_type = @item_type
    end

    alias eql? ==

    def bag
      @item_name.bag ^ @item_type.bag
    end
  end

  # def check_bag
  #   @bag.each {|item| print "#{item},"}
  # end

  # def add_to_bag
  #   @bag.push @item
  # end
# end

@bag1 = Bag.new 'Sword', 'A basic blade, used in one hand.'

inventory = {}
p inventory[@bag1]