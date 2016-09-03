# Doing an if statement or an unless statement as a one line expression
# However, do not use this format --> if true puts "This is pretty cool"
puts "This is pretty cool" if true
puts "This is a fun line too." unless false

# Using the ternary. The format is --> boolean ? Do this if true: Do this if false
puts 6 < 12 ? "6 is less than a dozen!" : "6 is not less than a dozen."

# Here is a more condensed version of the Case Statement
puts "Hello there!"
greeting = gets.chomp

case greeting
  when "English" then puts "Hello"
  when "French" then puts "Bonjour!"
  when "German" then puts "Guten Tag!"
  when "Finnish" then puts "Haloo!"
  else puts "I don't know that language!"
end   

# Using the conditional assignment operator
favorite_book = nil
puts favorite_book

favorite_book ||= "Cat's Cradle"
puts favorite_book

favorite_book ||= "Why's (Poignant) Guide to Ruby"
puts favorite_book

favorite_book = "Why's (Poignant) Guide to Ruby"
puts favorite_book

# Using the implicint return
def add(a,b)
  a + b  # Notice we are not using a return statement here. The return is implicint in Ruby!
end

add(3, 2)