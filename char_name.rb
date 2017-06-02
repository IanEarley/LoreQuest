class CharacterName
  attr_reader :char_name

  def char_name
    @char_name = gets.chomp.capitalize
    if @char_name == ""
      puts "\nPlease enter a name\n\n"
      char_name
    end

    puts "\nSo, your name is #{@char_name}? (Y) yes (N) no"
    choice = gets.chomp.downcase
    if choice.casecmp("y") == 0 || choice.casecmp("yes") == 0

    else
      puts "\nMy mistake, what was your name?\n\n"
      char_name
    end
  end
end