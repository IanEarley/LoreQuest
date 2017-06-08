require 'pry'
require_relative 'Character'
require_relative 'char_name'
require_relative 'Inventory'
require_relative 'press_enter'
require_relative 'Wallet'

class HomeTown

  def initialize(char_name:, char_class:, char_race:, wallet:, bag:, status:)
    @char_name = char_name
    @char_class = char_class
    @char_race = char_race
    @wealth = wallet
    @inventory = bag
    @player = status
    @inside = false
    @location = "Town Square"
  end

  def help_list
    case @location
    when "Town Square"
      commands = ["Help", "Leave", "Blacksmith", "General Store", "Tavern", "Chapel", "Magic Shop", "Investigate", "Leave", "Bag", "Status", "Wallet"]
      puts "\n" + commands.to_s
    when "Blacksmith"
      if @inside == false
        commands = ["Help", "Enter", "Town Square", "General Store", "Tavern", "Chapel", "Magic Shop", "Investigate", "Bag", "Status", "Wallet"]
        puts "\n" + commands.to_s
      else
        commands = ["Help", "Exit", "Investigate", "Chat", "Shop", "Bag", "Status", "Wallet"]
        puts "\n" + commands.to_s
      end
    when "Tavern"
      if @inside == false
        commands = ["Help", "Enter", "Town Square", "General Store", "Blacksmith", "Chapel", "Magic Shop", "Investigate", "Bag", "Status", "Wallet"]
        puts "\n" + commands.to_s
      else
        commands = ["Help", "Exit", "Investigate", "Chat", "Shop", "Rent", "Bag", "Status", "Wallet"]
        puts "\n" + commands.to_s
      end
    when "General Store"
      if @inside == false
        commands = ["Help", "Enter", "Town Square", "Blacksmith", "Tavern", "Chapel", "Magic Shop", "Investigate", "Bag", "Status", "Wallet"]
        puts "\n" + commands.to_s
      else
        commands = ["Help", "Exit", "Investigate", "Chat", "Shop", "Bag", "Status", "Wallet"]
        puts "\n" + commands.to_s
      end
    when "Magic Shop"
      if @inside == false
        commands = ["Help", "Enter", "Town Square", "General Store", "Tavern", "Chapel", "Blacksmith", "Investigate", "Bag", "Status", "Wallet"]
        puts "\n" + commands.to_s
      else
        commands = ["Help", "Exit", "Investigate", "Chat", "Shop", "Bag", "Status", "Wallet"]
        puts "\n" + commands.to_s
      end
    when "Chapel"
      if @inside == false
        commands = ["Help", "Enter", "Town Square", "General Store", "Tavern", "Blacksmith", "Magic Shop", "Investigate", "Bag", "Status", "Wallet"]
        puts "\n" + commands.to_s
      else
        commands = ["Help", "Exit", "Investigate", "Chat", "Heal", "Bag", "Status", "Wallet"]
        puts "\n" + commands.to_s
      end
    end
  end

  def choices
    puts "\nWhat would you like to do? (type 'help' to view available options)"
    choice = gets.chomp.strip.downcase
    case @location
    when "Town Square"
      case choice
      when "help", "h"
        help_list
        choices
      when "investigate", "i"
        system "clear"
        puts "The square is busy, the townsfolk going about their business, carts of various items being pulled by horses and oxen, you almost can't hear yourself think."
        press_enter
        system "clear"
        town_square
      when "leave"

      when "blacksmith"
        @location = "Blacksmith"
        system "clear"
        blacksmith
      when "general store"
        @location = "General Store"
        system "clear"
        general_store
      when "tavern"
        @location = "Tavern"
        system "clear"
        tavern
      when "chapel"
        @location = "Chapel"
        system "clear"
        chapel
      when "magic shop"
        @location = "Magic Shop"
        system "clear"
        magic_shop
      when "bag", "b"
        $inventory.check_bag
        choices
      when "status", "s"
        $player.check_stats
        choices
      when "wallet", "w"
        $wealth.check_wallet
        choices
      else
        puts "\nInvalid, type 'help' to view list of commands"
        choices
      end
    when "Blacksmith"
      if @inside == false
        case choice
        when "help", "h"
          help_list
          choices
        when "investigate", "i"
          system "clear"
          puts "You hear the clang of metal from within."
          press_enter
          system "clear"
          blacksmith
        when "town square"
          @location = "Town Square"
          system "clear"
          town_square
        when "general store"
          @location = "General Store"
          system "clear"
          general_store
        when "tavern"
          @location = "Tavern"
          system "clear"
          tavern
        when "chapel"
          @location = "Chapel"
          system "clear"
          chapel
        when "magic shop"
          @location = "Magic Shop"
          system "clear"
          magic_shop
        when "enter", "e"
          enter_exit
          system "clear"
          blacksmith
        when "bag", "b"
          $inventory.check_bag
          choices
        when "status", "s"
          $player.check_stats
          choices
        when "wallet", "w"
          $wealth.check_wallet
          choices
        else
          puts "\nInvalid, type 'help' to view list of commands"
          choices
        end
      else
        case choice
        when "help", "h"
          help_list
          choices
        when "investigate", "i"
          system "clear"
          puts "The clanging of metal from behind the counter sounds at a steady pace. The master smith is hard at work."
          press_enter
          system "clear"
          blacksmith
        when "exit", "e"
          enter_exit
          system "clear"
          blacksmith
        when "shop"
          system "clear"
          blacksmith_shop
        when "bag", "b"
          $inventory.check_bag
          choices
        when "status", "s"
          $player.check_stats
          choices
        when "wallet", "w"
          $wealth.check_wallet
          choices
        else
          puts "\nInvalid, type 'help' to view list of commands"
          choices
        end
      end
    when "Tavern"
      if @inside == false
        case choice
        when "help", "h"
          help_list
          choices
        when "investigate", "i"
          system "clear"
          puts "A woman's voice is singing from within the tavern."
          press_enter
          system "clear"
          tavern
        when "town square"
          @location = "Town Square"
          system "clear"
          town_square
        when "general store"
          @location = "General Store"
          system "clear"
          general_store
        when "blacksmith"
          @location = "Blacksmith"
          system "clear"
          blacksmith
        when "chapel"
          @location = "Chapel"
          system "clear"
          chapel
        when "magic shop"
          @location = "Magic Shop"
          system "clear"
          magic_shop
        when "enter", "e"
          enter_exit
          system "clear"
          tavern
        when "bag", "b"
          $inventory.check_bag
          choices
        when "status", "s"
          $player.check_stats
          choices
        when "wallet", "w"
          $wealth.check_wallet
          choices
        end
      else
        case choice
        when "help", "h"
          help_list
          choices
        when "investigate", "i"
          system "clear"
          puts "There are a number of interesting folk about: The bard, playing her lute and singing her song, the barkeep, tending to his many patrons with his expression hidden behind his impressive mustache, a cloaked patron, sitting at a table in the corner, a large man, boasting about his strength to onlookers, and a young elf, sitting at the bar with her nose in some tome."
          press_enter
          system "clear"
          tavern
        when "shop"
          system "clear"
          tavern_shop
        when "rent"
          system "clear"
          tavern_sleep
        when "exit", "e"
          enter_exit
          system "clear"
          tavern
        when "bag", "b"
          $inventory.check_bag
          choices
        when "status", "s"
          $player.check_stats
          choices
        when "wallet", "w"
          $wealth.check_wallet
          choices
        else
          puts "\nInvalid, type 'help' to view list of commands"
          choices
        end
      end
    when "General Store"
      if @inside == false
        case choice
        when "help", "h"
          help_list
          choices
        when "investigate", "i"
          system "clear"
          puts "The store seems quiet. Only a few townsolk seem to be shopping at the moment."
          press_enter
          system "clear"
          general_store
        when "town square"
          @location = "Town Square"
          system "clear"
          town_square
        when "blacksmith"
          @location = "Blacksmith"
          system "clear"
          blacksmith
        when "tavern"
          @location = "Tavern"
          system "clear"
          tavern
        when "chapel"
          @location = "Chapel"
          system "clear"
          chapel
        when "magic shop"
          @location = "Magic Shop"
          system "clear"
          magic_shop
        when "enter", "e"
          enter_exit
          system "clear"
          general_store
        when "bag", "b"
          $inventory.check_bag
          choices
        when "status", "s"
          $player.check_stats
          choices
        when "wallet", "w"
          $wealth.check_wallet
          choices
        else
          puts "\nInvalid, type 'help' to view list of commands"
          choices
        end
      else
        case choice
        when "help", "h"
          help_list
          choices
        when "investigate", "i"
          system "clear"
          puts "There are a wide range of goods on the shelves and the store seems well stocked. If it's supplies you need, you seem to be in the right place."
          press_enter
          system "clear"
          general_store
        when "exit", "e"
          enter_exit
          system "clear"
          general_store
        when "shop"
          system "clear"
          general_store_shop
        when "bag", "b"
          $inventory.check_bag
          choices
        when "status", "s"
          $player.check_stats
          choices
        when "wallet", "w"
          $wealth.check_wallet
          choices
        else
          puts "\nInvalid, type 'help' to view list of commands"
          choices
        end
      end
    when "Magic Shop"
      if @inside == false
        case choice
        when "help", "h"
          help_list
          choices
        when "investigate", "i"
          system "clear"
          puts "Upon investigating further, you notice a small sign in the window:"
          puts "\nFRONT DOOR CURRENTLY BEWITCHED, DO NOT TOUCH! PLEASE USE BACK ENTRANCE"
          puts "\n(new choice available, 'use back door')"
          press_enter
          system "clear"
          magic_shop
        when "town square"
          @location = "Town Square"
          system "clear"
          town_square
        when "general store"
          @location = "General Store"
          system "clear"
          general_store
        when "tavern"
          @location = "Tavern"
          system "clear"
          tavern
        when "chapel"
          @location = "Chapel"
          system "clear"
          chapel
        when "blacksmith"
          @location = "Blacksmith"
          system "clear"
          blacksmith
        when "enter", "e"
          system "clear"
          puts "You reach out and place your hand on the door, just as you notice a small sign stating something to effect of do not use. You were unable to read the sign fully however as you are thrown back a number of feet with a loud _BANG!_"
          choices
        when "use back door"
          enter_exit
          system "clear"
          magic_shop
        when "bag", "b"
          $inventory.check_bag
          choices
        when "status", "s"
          $player.check_stats
          choices
        when "wallet", "w"
          $wealth.check_wallet
          choices
        else
          puts "\nInvalid, type 'help' to view list of commands"
          choices
        end
      else
        case choice
        when "help", "h"
          help_list
          choices
        when "investigate", "i"
          system "clear"
          puts "There are a wide variety of random things cluttered about. The local wizard seems to be somewhat of a packrat."
          press_enter
          system "clear"
          magic_shop
        when "exit", "e"
          enter_exit
          system "clear"
          magic_shop
        when "shop"
          system "clear"
          magic_shop_shop
        when "bag", "b"
          $inventory.check_bag
          choices
        when "status", "s"
          $player.check_stats
          choices
        when "wallet", "w"
          $wealth.check_wallet
          choices
        else
          puts "\nInvalid, type 'help' to view list of commands"
          choices
        end
      end
    when "Chapel"
      if @inside == false
        case choice
        when "help", "h"
          help_list
          choices
        when "investigate", "i"
          system "clear"
          puts "You here the sounds of worshippers singing hymns from inside the small chapel."
          press_enter
          system "clear"
          chapel
        when "town square"
          @location = "Town Square"
          system "clear"
          town_square
        when "general store"
          @location = "General Store"
          system "clear"
          general_store
        when "tavern"
          @location = "Tavern"
          system "clear"
          tavern
        when "blacksmith"
          @location = "Blacksmith"
          system "clear"
          blacksmith
        when "magic shop"
          @location = "Magic Shop"
          system "clear"
          magic_shop
        when "enter", "e"
          enter_exit
          system "clear"
          chapel
        when "bag", "b"
          $inventory.check_bag
          choices
        when "status", "s"
          $player.check_stats
          choices
        when "wallet", "w"
          $wealth.check_wallet
          choices
        else
          puts "\nInvalid, type 'help' to view list of commands"
          choices
        end
      else
        case choice
        when "help", "h"
          help_list
          choices
        when "investigate", "i"
          system "clear"
          puts "The chapel is clean, a few priests are roaming about performing their duties. A small group of worshippers occupy the pews."
          press_enter
          system "clear"
          chapel
        when "exit", "e"
          enter_exit
          system "clear"
          chapel
        when "heal"
          system "clear"
          chapel_heal
        when "bag", "b"
          $inventory.check_bag
          choices
        when "status", "s"
          $player.check_stats
          choices
        when "wallet", "w"
          $wealth.check_wallet
          choices
        else
          puts "\nInvalid, type 'help' to view list of commands"
          choices
        end
      end
    end
  end

  def enter_exit
    @inside ^= true
  end

  def town_square
    puts "You stand at the center of town. A bustling square with a quaint waterfountain set at the middle. A message board stands near the fountain."
    choices
  end

  def blacksmith
    if @inside == false
      puts "'Fire and Irons', the local smithy, is a soot covered building standing on the east side of town. Clanging sounds eminate from within and you can already feel the heat floating from the open entryway."
      choices
    else
      puts "The interior of 'Fire and Irons' is covered with nearly as much soot as the outside. The clang of a hammer on metal can be heard from the back. A young man stands at the counter. He greets you as you enter: \n\n\"Welcome to Fire and Irons, let me know if you need any help.\""
      choices
    end
  end

  def blacksmith_shop
    puts "blacksmith shopping"
  end

  def tavern
    if @inside == false
      puts "You stand before the 'Brick and Tap' Tavern, it is a large, warm-looking building. The clink of mugs, the laughter of townsfolk and other sounds of revelry can be heard from within."
      choices
    else
      puts "The inside of the 'Brick and Tap' boasts a large number of patrons. The sounds heard from outside nearly drown out the bard near the hearth and her song. A gruff man tends to the bar of the tavern, carefully polishing a glass."
      choices
    end
  end

  def tavern_shop
    puts "tavern shopping"
  end

  def tavern_sleep
    puts "you rented a room"
  end

  def general_store
    if @inside == false
      puts "Outside of general_store"
      choices
    else
      puts "inside of general_store"
      choices
    end
  end

  def general_store_shop
    puts "general_store shopping"
  end

  def chapel
    if @inside == false
      puts "OUtside of chapel"
      choices
    else
      puts "inside of chapel"
      choices
    end
  end

  def chapel_heal
    puts "You healed at the chapel"
  end

  def magic_shop
    if @inside == false
      puts "There is an interesting glimmer in the air around the door, some after-effect of an experiment you'd wager, "
      choices
    else
      puts "inside text"
      choices
    end
  end

  def magic_shop_shop
    puts "magic_shop shopping"
  end
end