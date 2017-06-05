require_relative 'Character' && 'char_name' && 'press_enter'
class Confirm_character
  def initialize(char_name:, char_class:, char_race:)
    @char_name = char_name
    @char_class = char_class
    @char_race = char_race
    return
  end

  def confirm_char
    puts "So, you are #{@char_name}, the #{@char_race} #{@char_class}? (Y) yes / (N) no"
    @confirm = gets.chomp.downcase
    if @confirm == "y" || @confirm == "yes"
      puts "\nVery well... Let us begin!"
      press_enter

    elsif @confirm == "n" || @confirm == "no"
      puts "Let's try again then...\n\n"
      puts "What was your race? (Human, Elf, Dwarf, Halfling)\n\n"
      @player.race_select
      puts "What was your class? (Warrior, Rogue, Wizard, Cleric)\n\n"
      @player.class_select
      puts "What was your name?\n\n"
      @char_name
      confirm_char
    else
      puts "Please enter yes or no\n\n"
      confirm_char
    end
  end
end