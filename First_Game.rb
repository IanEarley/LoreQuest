require_relative 'char_name'
require_relative 'Character' 
require_relative 'confirm_char' 
require_relative 'press_enter'
require_relative 'Inventory'


puts "\nWelcome to (tba), a land of magic and monsters to be sure, but it is also a land of heroes and legends. One such legend has yet to be told... yours..."

press_enter

puts "Before we begin, I have a few questions for you:\n\n"

puts "\nFirst off, what are you? \n\n".lines.map { |line| line.strip.center(100) }.join("\n")
puts "-----Available Races-----\n
  Human: The most abundant race of (TBA), quite the determined and resiliant lot.\n
  Elf: Mysterious beings from pocket communities deep in the forests of (TBA), they are a lithe and intelligent people.\n
  Dwarf: A stout race that made their homes within the mountains of (TBA), they are a hearty and strong folk.\n
  Halfling: A small people that boast strong communities throughout the grasslands of (TBA), they are a clever and trustworthy people.\n\n".lines.map { |line| line.strip.center(100) }.join("\n")

@player = Character.new
@player.race_select
@player.race_choice


puts "\nSecond, what is your training? \n\n".lines.map { |line| line.strip.center(100) }.join("\n")
puts "-----Available Classes-----\n
  Warrior: A mighty hero, skilled in melee combat\n
  Cleric: A pillar of holy power, skilled in healing magics\n
  Rogue: One who strikes from the shadows, skilled at stealth\n
  Wizard: A scholarly spellcaster, skilled with magic\n\n".lines.map { |line| line.strip.center(100) }.join("\n")

@player.class_select
@player.class_choice
@player.base_stats
@player.check_human


puts "\nI guess I should have asked you this first, but what is your name?\n\n".lines.map { |line| line.strip.center(100) }.join("\n")

char_name

confirm_char

@inventory = Inventory.new
@inventory.add_to_bag
@inventory.check_bag