require_relative 'Character'

class Inventory
  def initialize(char_class:)
    @char_class = char_class
    @bag = starting_bag
  end

  def starting_bag
    if @char_class == "Warrior"
      ["Iron Sword", "Iron Plate", "Iron Shield", "Iron Helm", "Iron Greaves", "Iron Gauntlets", "Potion of Healing"]
    end
  end

  def check_bag
    @bag.each do |item|
      print "#{item}" + ", "
    end
  end

  def add_to_bag
    @bag << @item
  end
end
