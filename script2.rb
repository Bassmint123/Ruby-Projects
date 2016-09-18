# Typical form entry program, but written in Ruby

print "What's your first name?"
first_name = gets.chomp
first_name.capitalize!  # The exclamation means the original value of first_name can be changed. In this case, it is capatalized. 

print "What's your last name?"
last_name = gets.chomp
last_name.capitalize!

print "What city are you from?"
city = gets.chomp
city.capitalize!

print "What state or province are you from?"
state = gets.chomp
state.upcase!   # The exclamation means the original value of state can be changed. In this case, it is made uppercase. 

puts "Your name is #{first_name} #{last_name} and you're from #{city}, #{state}!"
