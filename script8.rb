
# 1. A block is just a bit of code between do..end or {}. It's not an object on its own, 
#    but it can be passed to methods like .each or .select.
# 2. A proc is a saved block we can use over and over.
# 3. A lambda is just like a proc, only it cares about the number of arguments 
#    it gets and it returns to its calling method rather than returning immediately.


# Example of a code block
5.times do |x|
  puts "I'm a block!"
end
# Refactored another way
5.times {puts "I'm a block!"}

# The collect method takes a block and applies the expression in the block to every element in an array. 
my_nums = [1, 2, 3]
my_nums.collect { |num| num ** 2 }
my_nums.each  { |x| puts "#{x}" } 
# ==> [1, 4, 9]
# However,
# my_nums is still [1, 2, 3]. This is because .collect returns a copy of my_nums, 
# but doesn't change (or mutate) the original my_nums array.

# If we want to do that, we can use .collect! with an exclamation point:
my_nums = [1, 2, 3]
my_nums.collect! { |num| num ** 2 }
# ==> [1, 4, 9]
my_nums.each  { |x| puts "#{x}" } 
# ==> [1, 4, 9]

# The map! method does the same thing as the collect! method
my_nums = [1, 2, 3]
my_nums.map! { |num| num ** 2 }
# ==> [1, 4, 9]
my_nums.each  { |x| puts "#{x}" } 
# ==> [1, 4, 9]

# An example using the yield method.
def block_test
  puts "We're in the method!"
  puts "Yielding to the block..."
  yield
  puts "We're back in the method!"
end

block_test { puts ">>> We're in the block!" }

# Using the yield method while passing Brad as the name parameter
def yield_name(name)
  puts "In the method! Let's yield."
  yield("Kim")
  puts "In between the yields!"
  yield(name)
  puts "Block complete! Back in the method."
end

yield_name("Eric") { |n| puts "My name is #{n}." }
# Calling the method with my name!
yield_name("Brad") { |n| puts "My name is #{n}." }

# Passing the yield parameter
def double(n)
    yield(4)
end

double(3) { |n| puts "My result is #{n * 2}." }  # Prints out => My result is 8.

#
# procs help us do DRY code. Don't Repeat Yourself
# Example of using a proc for multiples of 3 to 100
#
multiples_of_3 = Proc.new do |n|
  n % 3 == 0
end

(1..100).to_a.select(&multiples_of_3) # The & is used to convert the multiples_of_3 proc into a block

# Another example of using a proc
floats = [1.2, 3.45, 0.91, 7.727, 11.42, 482.911]
round_down = Proc.new {|x| x.floor} # The .floor method rounds a float (a number with a decimal) down to the nearest integer.
ints = floats.collect(&round_down)
ints.each {|x| puts "#{x}"}

# Another example of using a proc
# Here at the amusement park, you have to be four feet tall
# or taller to ride the roller coaster. Let's use .select on
# each group to get only the ones four feet tall or taller.

group_1 = [4.1, 5.5, 3.2, 3.3, 6.1, 3.9, 4.7]
group_2 = [7.0, 3.8, 6.2, 6.1, 4.4, 4.9, 3.0]
group_3 = [5.5, 5.1, 3.9, 4.3, 4.9, 3.2, 3.2]

# This is the Proc
over_4_feet = Proc.new do |height|
   height >= 4 
end

# Changed these three so that they use the over_4_feet Proc
can_ride_1 = group_1.select(&over_4_feet)
can_ride_1.each {|x| puts "#{x}"}
can_ride_2 = group_2.select(&over_4_feet)
can_ride_2.each {|x| puts "#{x}"}
can_ride_3 = group_3.select(&over_4_feet)
can_ride_3.each {|x| puts "#{x}"}

# Creates a method that calls a proc. Notice how the method takes no arguments to do this.
def greeter
    yield
 end

phrase = Proc.new {puts "Hello there!"}
greeter(&phrase) # Outputs => Hello there!


# Unlike blocks, we can call procs directly by using Ruby's .call method. 
# This is easier than using a method to call the proc. Check it out!
test = Proc.new { puts "This does something" }
test.call # executes the proc

# Here we convert symbols to procs using that handy little "&" symbol
numbers_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
strings_array = numbers_array.map(&:to_s)
strings_array.each {|x| puts "#{x}"}


# Like procs, lambdas are objects. when we pass the lambda to lambda_demo, 
# the method calls the lambda and executes its code.
def lambda_demo(a_lambda)
  puts "I'm the method!"
  a_lambda.call
end

lambda_demo(lambda { puts "I'm the lambda!" })


# Using more of the lambda syntax
strings = ["leonardo", "donatello", "raphael", "michaelangelo"]
symbolize = lambda { |x| x.to_sym }   # Create the symbolize lambda
symbols = strings.collect(&symbolize) # Convert array elements to symbols
symbols.each {|y| puts "#{y}"}        # Output => [:leonardo, :donatello, :raphael, :michaelangelo]


#
# Proc vs. lambda. Check out the difference.
#
# First, a lambda checks the number of arguments passed to it, while a proc does not. 
# This means that a lambda will throw an error if you pass it the wrong number of arguments, 
# whereas a proc will ignore unexpected arguments and assign nil to any that are missing.
#
# Second, when a lambda returns, it passes control back to the calling method; 
# when a proc returns, it does so immediately, without going back to the calling method.
#
# AT RUNTIME...
# See how the proc says Batman will win? This is because it returns immediately, 
# without going back to the batman_ironman_proc method.
#
# Our lambda, however, goes back into the method after being called, 
# so the method returns the last code it evaluates: "Iron Man will win!"

def batman_ironman_proc
  victor = Proc.new { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_proc

def batman_ironman_lambda
  victor = lambda { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_lambda

# Create a lambda, symbol_filter, that takes one parameter and checks to see if that parameter .is_a? Symbol.
my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]
symbol_filter = lambda { |x| x.is_a? Symbol }
symbols = my_array.select(&symbol_filter)
symbols.each {|y| puts "#{y}"}






