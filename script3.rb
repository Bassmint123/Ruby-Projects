print "Integer please: "
user_num = Integer(gets.chomp)

if user_num < 0
  puts "You picked a negative integer!"
elsif user_num > 0
  puts "You picked a positive integer!"
else
  puts "You picked zero!"
end

# Testing out the unless control flow to test for "false" conditions
bacon = false
unless bacon  
  puts "I'm writing Ruby programs!"
else
  puts "Time to eat!"
end

# Real simple unless usage example
problem = false
unless problem
   print "Unless fired"
end

# Control flow using a user's input to replace "s" with "th" 
print "Thtring, pleathe!: "
user_input = gets.chomp
user_input.downcase!

if user_input.include? "s"  #As a general rule, Ruby methods that end with ? evaluate to the boolean values true or false.
  user_input.gsub!(/s/, "th")  # Substitute "s" with a "th"
else
  puts "There are no s characters in your input\n"
end
  
puts "Your string is: #{user_input}"



# Comparitors checking values
is_true = 2 != 3
is_false = 2 == 3
test_1 = 17 > 16
test_2 = 21 < 30
test_3 = 9 >= 9
test_4 = -11 <= 4

# Boolean AND
# boolean_1 = 77 < 78 && 77 < 77
boolean_1 = false

# boolean_2 = true && 100 >= 100
boolean_2 = true

# boolean_3 = 2**3 == 8 && 3**2 == 9
boolean_3 = true

# Boolean OR
# boolean_1 = 2**3 != 3**2 || true
boolean_1 = true

# boolean_2 = false || -10 > -9
boolean_2 = false

# boolean_3 = false || false
boolean_3 = false

# Boolean NOT uses an exclamation mark for syntax this is like an inverter
# boolean_1 = !true
boolean_1 = false

# boolean_2 = !true && !true
boolean_2 = false

# boolean_3 = !(700 / 10 == 70)
boolean_3 = false

# Boolean Combined
# boolean_1 = (3 < 4 || false) && (false || true)
boolean_1 = true

# boolean_2 = !true && (!true || 100 != 5**2)
boolean_2 = false

# boolean_3 = true || !(true || false)
boolean_3 = true


