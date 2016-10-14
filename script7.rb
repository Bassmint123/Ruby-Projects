# Doing an if statement or an unless statement as a one line expression
# However, do not use this format --> if true puts "This is pretty cool"
puts "This is pretty cool" if true
puts "This is a fun line too." unless false

# Using the ternary for short hand. The format is --> boolean ? Do this if true: Do this if false
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

# Using the short-circuit feature for && and ||. In other words it does not have to 
# evaluate the entire expression. For example if a && b and we know a is false, then
# then it does not need to read past && to know the whole expression will be false.
def a
  puts "A was evaluated!"
  return true
end

def b
  puts "B was also evaluated!"
  return true
end

puts a || b
puts "------"
puts a && b

# Using the .times operator
5.times { puts "Odelay!" }
# Prints 5 "Odelay!"s on separate lines

# Using the each operator
[1, 2, 3].each { |x| puts x * 10 }
# Prints 10, 20, 30 on separate lines


# Using the .upto method instead of a for loop
95.upto(100) { |num| print num, " " }
# Prints 95 96 97 98 99 100
"L".upto("P") { |num| puts num, " " }
# Prints L M N O P

# Example of using a Call and Response
# This checks to see if integer "age" will respond to next
[1, 2, 3].respond_to?(:push)  # would return true as the push method can be used on an array
[1, 2, 3].respond_to?(:to_sym) # would return false as the to_sym method cannot be used on an array

# Instead of typing out the .push method name, we can 
# simply use <<, the concatenation operator (also known as "the shovel") to add an element to the end of an array.
alphabet = ["a", "b", "c"]
alphabet << "d"
# It also works on strings too!
caption = "A giraffe surrounded by "
caption << "weezards!" 
puts caption  # outputs "A giraffe surrounded by weezards!"
age = 38
"I am " << age.to_s << " years old."# ==> "I am 38 years old."

#
# Version 1
# Some code that could be refactored starts like this segment of code
# can be rewritten like Version 2 below.
#
$VERBOSE = nil    # We'll explain this at the end of the lesson.
require 'prime'   # This is a module. We'll cover these soon!

def first_n_primes(n)

  unless n.is_a? Integer
    return "n must be an integer."
  end

  if n <= 0
    return "n must be greater than 0."
  end
  
  prime_array = [] if prime_array.nil?
  
  prime = Prime.new
  for num in (1..n)
    prime_array.push(prime.next)
  end
  return prime_array
end

first_n_primes(10)

#
# This is Version 2 of the code above, except refactored. The code
# does the exact same thing as Version 1. Version 3 below, is factored even more!
#
$VERBOSE = nil    # We'll explain this at the end of the lesson.
require 'prime'   # This is a module. We'll cover these soon!

def first_n_primes(n)
  puts "n must be an integer." unless n.is_a? Integer
  puts "n must be greater than 0." if n <= 0
  prime_array ||= []
  prime = Prime.new
  n.times { prime_array << (prime.next)}
  prime_array
end

first_n_primes(10)

#
# This is Version 3. Yet, further refactored.
#
require 'prime'
def first_n_primes(n)
  # Check for correct input!
  "n must be an integer" unless n.is_a? Integer
  "n must be greater than 0" if n <= 0

  # The Ruby 1.9 Prime class makes the array automatically!
  prime = Prime.instance
  prime.first n
end

first_n_primes(10)


















