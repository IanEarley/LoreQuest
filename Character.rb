class Character

  def race_select
    @races = ["Human", "Elf", "Dwarf", "Halfling"]
    @char_race = gets.chomp.downcase.capitalize
    if @races.include?(@char_race)
      
    else
      puts "\nPlease choose a race from the list\n\n"
      race_select
      return
    end
  end
    
  def race_choice
    if @char_race == "Human"
      puts "\nI should have recognized you as such.\n\n"
    elsif @char_race == "Elf"
      puts "\nI guess the ears kind of gave it away huh.\n\n"
    elsif @char_race == "Dwarf"
      puts "\nI guess the beard gives it away eh?\n\n"
    else
      puts "\nOh good, I almost mistook you for a child.\n\n"
    end
  end

  def get_race
    @char_race
  end

  def class_select
    classes = ["Warrior", "Rogue", "Wizard", "Cleric"]
    @char_class = gets.chomp.downcase.capitalize
    if classes.include?(@char_class)
    
    else
      puts "\nPlease choose a class from the list\n\n"
      class_select
    end
  end
    
  def class_choice
    if @char_class == "Warrior"
      puts "\nYou certainly look tough.\n\n"
    elsif @char_class == "Rogue"
      puts "\nThat would explain why I didn't hear you come in.\n\n"
    elsif @char_class == "Wizard" 
      puts "\nAh, I could tell you had a magical air about you.\n\n"
    else @char_class == "Cleric"
      puts "\nThat explains the holy raiments\n\n"
    end
  end

  def get_class
    @char_class
  end

  def base_stats
    if @char_class == "Warrior"
      @stats = {"HP" => 15, "STR" => 15, "DEX" => 12, "INT" => 8, "WIS" => 10}
    elsif @char_class == "Rogue"
      @stats = {"HP" => 10, "STR" => 8, "DEX" => 15, "INT" => 10, "WIS" => 10}
    elsif @char_class == "Wizard"
      @stats = {"HP" => 8, "STR" => 8, "DEX" => 10, "INT" => 15, "WIS" => 12}
    elsif @char_class == "Cleric"
      @stats = {"HP" => 12, "STR" => 10, "DEX" => 8, "INT" => 10, "WIS" => 15}
    end
  end

  def race_mod_human
    puts "As a human, what did you specialize in?"
    puts "pick a stat to increase by 2: (HP, STR, DEX, INT, or WIS)"
    choice = gets.chomp.upcase
      if choice == "HP"
        @stats["HP"] += 2
      elsif choice == "STR"
        @stats["STR"] += 2
      elsif choice == "DEX"
        @stats["DEX"] += 2
      elsif choice == "INT"
        @stats["INT"] += 2
      elsif choice == "WIS"
        @stats["WIS"] += 2
      else
        puts "Please choose a valid stat."
        race_mod_human
        return
      end
  end

  def race_mod
    if @char_race == "Elf"
      @stats["HP"] -= 2
      @stats["DEX"] += 2
      @stats["INT"] += 2
    elsif @char_race == "Dwarf"
      @stats["STR"] += 2
      @stats["DEX"] -= 2
      @stats["HP"] += 2
    elsif @char_race == "Halfling"
      @stats["DEX"] += 2
      @stats["INT"] -= 2
      @stats["WIS"] += 2
    end
  end

  def check_human
    if @char_race == "Human"
      race_mod_human
    else
      race_mod
    end
  end

  def get_stats
    @stats.each {|stat, value| puts "#{stat}: #{value}" }
  end
end