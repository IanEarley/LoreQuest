def confirm
  choice = gets.chomp.downcase
  if choice.casecmp("y")==0 || choice.casecmp("yes")==0
  
  elsif choice.casecmp("n")==0 || choice.casecmp("no")==0

  else
    puts "Please enter yes or no."
    confirm
  end