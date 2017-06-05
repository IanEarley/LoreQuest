require_relative 'Character'

class Inventory
  def initialize(char_class:)
    @char_class = char_class
    @bag = starting_bag
  end

  def starting_bag
    if @char_class == "Warrior"
      ["Iron Sword", "Iron Plate", "Iron Shield", "Iron Helm", "Iron Greaves", "Iron Gauntlets", "Potion of Healing"]
    elsif @char_class == "Rogue"
      ["Iron Dagger", "Leather Armor", "Leather Greaves", "Leather Bracers", "Thieve's Tools"]
    elsif @char_class == "Wizard"
      ["Quarterstaff", "Cloth Robes", "Cloth Hat", "Cloth Shoes", "Spellbook", "Potion of Mana"]
    else
      ["Iron Mace", "Wooden Shield", "Chainmail", "Chain Helm", "Iron Gauntlets", "Iron Greaves", "Holy Symbol"]
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
