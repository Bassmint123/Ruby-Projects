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

# Example of using a proc for multiples of 3 to 100
multiples_of_3 = Proc.new do |n|
  n % 3 == 0
end

(1..100).to_a.select(&multiples_of_3)








