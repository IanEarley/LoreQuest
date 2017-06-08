require_relative 'Character'

class Wallet

  def initialize(char_class:)
    @char_class = char_class
    $wallet = starting_wallet
  end

  def starting_wallet
    case @char_class
    when "Warrior"
      $wallet = 10
    when "Rogue"
      $wallet = 15
    when "Wizard"
      $wallet = 8
    when "Cleric"
      $wallet = 10
    end
  end

  def check_wallet
    puts "You have #{$wallet} Gold"
  end

  def get_wallet
    $wallet
  end
end